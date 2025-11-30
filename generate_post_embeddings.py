#!/usr/bin/env python3
"""
Generate and cache embeddings for Hugo posts using Ollama's embeddinggemma model.

The script:
* Ensures an Ollama server is running (starts one if necessary).
* Computes embeddings for markdown posts under content/posts (excluding _index.md).
* Persists embeddings, pairwise similarities, and top related posts in data/post_embeddings.json.
* Supports incremental updates by hashing post content, and a --refresh flag to rebuild from scratch.
* Prints lightweight progress bars during embedding and similarity computation.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import math
import os
import shutil
import signal
import subprocess
import sys
import time
from dataclasses import dataclass
from datetime import datetime, timezone
from pathlib import Path
from typing import Dict, List, Optional, Tuple
from urllib import error, request


CONTENT_DIR = Path("content/posts")
DB_PATH = Path("data/post_embeddings.json")
MODEL_NAME = "embeddinggemma"
OLLAMA_HOST = os.environ.get("OLLAMA_HOST", "http://127.0.0.1:11434")


@dataclass
class PostRecord:
    key: str
    content_path: str
    title: str
    slug: Optional[str]
    content_hash: str
    embedding: Optional[List[float]] = None


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Generate Ollama embeddings for Hugo posts.")
    parser.add_argument(
        "--refresh",
        action="store_true",
        help="Recompute embeddings for all posts and overwrite the existing cache.",
    )
    return parser.parse_args()


def ensure_data_directory() -> None:
    DB_PATH.parent.mkdir(parents=True, exist_ok=True)


def list_post_files() -> List[Path]:
    if not CONTENT_DIR.exists():
        raise RuntimeError(f"Missing content directory: {CONTENT_DIR}")
    return sorted(
        f for f in CONTENT_DIR.glob("*.md") if f.name != "_index.md" and f.is_file()
    )


def split_front_matter(text: str) -> Tuple[str, str, str]:
    if not text:
        return "", "", ""
    lines = text.splitlines()
    if not lines:
        return "", "", ""
    delimiter = lines[0].strip()
    if delimiter not in ("---", "+++"):
        return "", text, ""
    delimiter = lines[0].strip()
    try:
        closing_index = lines[1:].index(delimiter) + 1
    except ValueError:
        try:
            closing_index = next(
                i for i, line in enumerate(lines[1:], start=1) if line.strip() == delimiter
            )
        except StopIteration:
            return "", "\n".join(lines[1:]), delimiter
    front = "\n".join(lines[1:closing_index])
    body = "\n".join(lines[closing_index + 1 :])
    return front, body, delimiter


def try_import_yaml():
    try:
        import yaml  # type: ignore
        return yaml
    except Exception:
        return None


def try_import_toml():
    try:
        import tomllib  # type: ignore[attr-defined]
        return tomllib
    except Exception:
        try:
            import tomli as tomllib  # type: ignore
            return tomllib
        except Exception:
            return None


YAML_MODULE = try_import_yaml()
TOML_MODULE = try_import_toml()


def parse_front_matter(front: str, delimiter: str) -> Dict[str, object]:
    if not front.strip():
        return {}
    if delimiter == "+++" and TOML_MODULE is not None:
        try:
            data = TOML_MODULE.loads(front)  # type: ignore[attr-defined]
            return data or {}
        except Exception:
            pass
    if delimiter != "+++" and YAML_MODULE is not None:
        try:
            data = YAML_MODULE.safe_load(front)  # type: ignore[attr-defined]
            return data or {}
        except Exception:
            pass
    separator = ":" if delimiter != "+++" else "="
    parsed: Dict[str, object] = {}
    for raw_line in front.splitlines():
        line = raw_line.strip()
        if not line or line.startswith("#") or separator not in line:
            continue
        key, value = line.split(separator, 1)
        parsed[key.strip()] = value.strip().strip('"').strip("'")
    return parsed


def extract_post_record(file_path: Path) -> PostRecord:
    text = file_path.read_text(encoding="utf-8")
    front_raw, body, delimiter = split_front_matter(text)
    meta = parse_front_matter(front_raw, delimiter)
    title = str(meta.get("title") or file_path.stem)
    slug = meta.get("slug")
    slug_str = str(slug) if slug is not None else None
    content_hash = hashlib.sha256(body.encode("utf-8")).hexdigest()
    rel_path = file_path.relative_to(Path("content"))
    key = str(rel_path)
    content_path = str(rel_path.with_suffix(""))
    cleaned_body = body.strip()
    return PostRecord(
        key=key,
        content_path=content_path,
        title=title,
        slug=slug_str,
        content_hash=content_hash,
        embedding=None,
    ), cleaned_body


def http_request(path: str, data: Optional[bytes] = None, timeout: float = 10) -> bytes:
    url = f"{OLLAMA_HOST.rstrip('/')}{path}"
    headers = {"Content-Type": "application/json"}
    req = request.Request(url, data=data, headers=headers)
    with request.urlopen(req, timeout=timeout) as resp:
        return resp.read()


def ping_ollama() -> bool:
    try:
        http_request("/api/tags", timeout=3)
        return True
    except error.URLError:
        return False
    except Exception:
        return False


def start_ollama_server() -> subprocess.Popen:
    if shutil.which("ollama") is None:
        raise RuntimeError("The 'ollama' CLI was not found in PATH.")
    process = subprocess.Popen(
        ["ollama", "serve"],
        stdout=subprocess.DEVNULL,
        stderr=subprocess.DEVNULL,
        start_new_session=True,
    )
    return process


def ensure_ollama_ready() -> Optional[subprocess.Popen]:
    if ping_ollama():
        return None
    process = start_ollama_server()
    for _ in range(20):
        if ping_ollama():
            return process
        time.sleep(0.5)
    try:
        process.terminate()
    except Exception:
        pass
    raise RuntimeError("Failed to start Ollama server within the expected time.")


def embed_text(text: str) -> List[float]:
    payload = json.dumps({"model": MODEL_NAME, "input": [text]}).encode("utf-8")
    raw = http_request("/api/embed", data=payload, timeout=120)
    data = json.loads(raw.decode("utf-8"))
    if "embedding" in data and isinstance(data["embedding"], list):
        return data["embedding"]
    embeddings = data.get("embeddings")
    if isinstance(embeddings, list) and embeddings:
        first = embeddings[0]
        if isinstance(first, list):
            return first
    raise RuntimeError(f"Unexpected response from Ollama: {data}")


def load_database(refresh: bool) -> Dict[str, object]:
    if refresh or not DB_PATH.exists():
        return {
            "model": MODEL_NAME,
            "generated_at": datetime.now(timezone.utc).isoformat(),
            "posts": {},
        }
    try:
        with DB_PATH.open("r", encoding="utf-8") as fh:
            data = json.load(fh)
    except json.JSONDecodeError as exc:
        raise RuntimeError(f"Failed to read {DB_PATH}: {exc}") from exc
    if data.get("model") != MODEL_NAME:
        return {
            "model": MODEL_NAME,
            "generated_at": datetime.now(timezone.utc).isoformat(),
            "posts": {},
        }
    return data


def render_progress(current: int, total: int, prefix: str) -> None:
    width = 32
    ratio = 0 if total == 0 else current / total
    filled = int(width * ratio)
    bar = "#" * filled + "-" * (width - filled)
    sys.stdout.write(f"\r{prefix} [{bar}] {current}/{total}")
    if current == total:
        sys.stdout.write("\n")
    sys.stdout.flush()


def cosine_similarity(vec_a: List[float], vec_b: List[float]) -> float:
    if not vec_a or not vec_b:
        return 0.0
    if len(vec_a) != len(vec_b):
        raise ValueError("Embedding vectors have different lengths.")
    dot = sum(a * b for a, b in zip(vec_a, vec_b))
    norm_a = math.sqrt(sum(a * a for a in vec_a))
    norm_b = math.sqrt(sum(b * b for b in vec_b))
    if norm_a == 0 or norm_b == 0:
        return 0.0
    return dot / (norm_a * norm_b)


def compute_similarities(posts: Dict[str, Dict[str, object]]) -> None:
    keys = list(posts.keys())
    embeddings = {key: posts[key].get("embedding") for key in keys}
    total_ops = len(keys) * (len(keys) - 1) // 2
    completed = 0
    if total_ops == 0:
        for key in keys:
            posts[key]["similarities"] = {}
            posts[key]["top_similar"] = []
        return

    for idx, key_a in enumerate(keys):
        vec_a = embeddings[key_a]
        if not isinstance(vec_a, list):
            continue
        sims: Dict[str, float] = {}
        for key_b in keys:
            if key_a == key_b:
                continue
            vec_b = embeddings[key_b]
            if not isinstance(vec_b, list):
                continue
            score = cosine_similarity(vec_a, vec_b)
            sims[key_b] = score
        posts[key_a]["similarities"] = sims
        sorted_peers = sorted(
            sims.items(), key=lambda item: item[1], reverse=True
        )[:3]
        posts[key_a]["top_similar"] = [
            {
                "post_key": peer_key,
                "content_path": posts[peer_key].get("content_path"),
                "title": posts[peer_key].get("title"),
                "score": round(score, 6),
            }
            for peer_key, score in sorted_peers
            if posts.get(peer_key)
        ]
        completed += len(keys) - idx - 1
        render_progress(completed, total_ops, "Computing similarities")
    if total_ops:
        render_progress(total_ops, total_ops, "Computing similarities")


def main() -> None:
    args = parse_args()
    ensure_data_directory()
    post_files = list_post_files()
    records: Dict[str, PostRecord] = {}
    bodies: Dict[str, str] = {}

    for file_path in post_files:
        record, body = extract_post_record(file_path)
        records[record.key] = record
        bodies[record.key] = body

    ollama_process = None
    try:
        ollama_process = ensure_ollama_ready()
        database = load_database(refresh=args.refresh)
        existing_posts = database.get("posts", {})
        if not isinstance(existing_posts, dict):
            existing_posts = {}
        
        # Track if any changes were made
        has_changes = False
        
        # Drop records for deleted posts.
        for stale_key in list(existing_posts.keys()):
            if stale_key not in records:
                existing_posts.pop(stale_key, None)
                has_changes = True

        posts_data: Dict[str, Dict[str, object]] = {}
        for key, record in records.items():
            entry = existing_posts.get(key, {})
            if not isinstance(entry, dict):
                entry = {}
            embedding = entry.get("embedding")
            cached_hash = entry.get("content_hash")
            needs_embedding = (
                args.refresh
                or embedding is None
                or cached_hash != record.content_hash
            )
            posts_data[key] = {
                "title": record.title,
                "slug": record.slug,
                "content_path": record.content_path,
                "content_hash": record.content_hash,
                "embedding": embedding if not needs_embedding else None,
            }

        to_process = [
            key for key, meta in posts_data.items() if meta.get("embedding") is None
        ]

        if to_process:
            has_changes = True
            render_progress(0, len(to_process), "Embedding posts     ")
            for index, key in enumerate(to_process, start=1):
                text_body = bodies[key]
                if not text_body.strip():
                    posts_data[key]["embedding"] = []
                else:
                    posts_data[key]["embedding"] = embed_text(text_body)
                posts_data[key]["updated_at"] = datetime.now(timezone.utc).isoformat()
                render_progress(index, len(to_process), "Embedding posts     ")
        else:
            print("No new or changed posts detected; reusing cached embeddings.")

        if not to_process:
            for key in posts_data:
                if "updated_at" not in posts_data[key]:
                    posts_data[key]["updated_at"] = existing_posts.get(key, {}).get(
                        "updated_at",
                        datetime.now(timezone.utc).isoformat(),
                    )

        compute_similarities(posts_data)
        database["posts"] = posts_data
        
        # Only update generated_at if there were actual changes
        if has_changes or args.refresh:
            database["generated_at"] = datetime.now(timezone.utc).isoformat()
        
        with DB_PATH.open("w", encoding="utf-8") as fh:
            json.dump(database, fh, ensure_ascii=False, indent=2)
        print(f"Wrote embedding database to {DB_PATH}")
    finally:
        if ollama_process is not None:
            try:
                ollama_process.send_signal(signal.SIGTERM)
                ollama_process.wait(timeout=5)
            except Exception:
                try:
                    ollama_process.kill()
                except Exception:
                    pass


if __name__ == "__main__":
    main()

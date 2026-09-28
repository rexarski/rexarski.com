<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:atom="http://www.w3.org/2005/Atom" xmlns:dc="http://purl.org/dc/elements/1.1/" version="1.0">
  <xsl:output method="xml" omit-xml-declaration="no" indent="yes" doctype-system="" doctype-public=""/>
  <xsl:template match="/">
    <html xmlns="http://www.w3.org/1999/xhtml" lang="en">
      <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title><xsl:value-of select="rss/channel/title"/> — Web Feed</title>
        <link rel="preconnect" href="https://fonts.googleapis.com"/>
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin=""/>
        <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Mono:wght@400;500;600;700&amp;family=Noto+Sans+SC:wght@400..700&amp;display=swap" rel="stylesheet"/>
        <style><![CDATA[
          :root {
            color-scheme: light;
            --bg: #f7f5f0;
            --surface: #efece6;
            --text: #3b3835;
            --heading: #1c1a17;
            --link-hover-fg: #f7f5f0;
            --link-hover-bg: #1c1a17;
            --accent: #c23b22;
            --muted: #6f6a63;
            --border: #e3dfd7;
            --code-bg: #eeeae3;
            --mark-bg: #f7e68a;
            --font-body: 'Noto Sans SC', sans-serif;
            --font-mono: 'IBM Plex Mono', 'Noto Sans SC', monospace;
          }
          ::selection { background-color: var(--heading); color: var(--bg); }
          * { box-sizing: border-box; }
          html, body { margin: 0; padding: 0; }
          body {
            font-family: var(--font-body);
            background: var(--bg);
            color: var(--text);
            line-height: 1.68;
            margin: 0;
            padding: 28px 0 32px;
            min-height: 100vh;
            word-wrap: break-word;
            overflow-wrap: break-word;
          }
          .wrap {
            max-width: 42rem;
            margin: 0 auto;
            padding: 0 20px;
          }
          a {
            color: var(--text);
            text-decoration: underline;
            text-decoration-thickness: 2px;
            text-underline-offset: 0.18em;
            border-radius: 2px;
          }
          a:hover { color: var(--link-hover-fg); background-color: var(--link-hover-bg); }
          .back {
            font-family: var(--font-mono);
            font-size: 0.8rem;
            color: var(--muted);
            margin-bottom: 1.75rem;
          }
          .back a { color: var(--muted); text-decoration: underline; }
          .back a:hover { color: var(--link-hover-fg); background-color: var(--link-hover-bg); }
          .intro {
            margin-bottom: 1.5rem;
            color: var(--muted);
            font-size: 0.9rem;
            line-height: 1.65;
          }
          .intro strong { color: var(--heading); }
          .card {
            background: transparent;
            border: 1px solid var(--border);
            border-radius: 6px;
            padding: 1.25rem 1.5rem;
            margin-bottom: 1.5rem;
          }
          h1 {
            font-family: var(--font-body);
            font-size: 1.9rem;
            font-weight: 700;
            color: var(--heading);
            margin: 0 0 0.35rem 0;
            letter-spacing: -0.03em;
            line-height: 1.2;
          }
          .tagline { color: var(--muted); font-size: 0.9rem; margin: 0 0 0 0; }
          h2 {
            font-family: var(--font-body);
            font-size: 1.15rem;
            font-weight: 700;
            color: var(--heading);
            margin: 0 0 1rem 0;
            letter-spacing: -0.01em;
          }
          .feed-url-wrap { margin: 1rem 0 0; }
          .feed-url-wrap label {
            display: block;
            font-family: var(--font-mono);
            font-size: 0.75rem;
            font-weight: 400;
            color: var(--muted);
            margin-bottom: 0.5rem;
          }
          .feed-url-wrap input {
            width: 100%;
            padding: 0.6rem 0.8rem;
            font-family: var(--font-mono);
            font-size: 0.85rem;
            border: 1px solid var(--border);
            border-radius: 4px;
            background: var(--code-bg);
            color: var(--heading);
          }
          .feed-url-wrap input:focus { outline: none; border-color: var(--accent); }
          ul.item-list { list-style: none; padding: 0; margin: 0; }
          ul.item-list li {
            margin-bottom: 0;
            padding: 0.9rem 0;
            border-bottom: 1px solid var(--border);
          }
          ul.item-list li:last-child { border-bottom: none; }
          .item-title {
            font-family: var(--font-body);
            font-size: 1rem;
            font-weight: 700;
            margin: 0 0 0.2rem 0;
          }
          .item-title a { color: var(--heading); text-decoration: none; }
          .item-title a:hover { text-decoration: underline; }
          .item-date {
            font-family: var(--font-mono);
            font-size: 0.75rem;
            color: var(--muted);
            font-variant-numeric: tabular-nums;
          }
        ]]></style>
      </head>
      <body>
        <div class="wrap">
          <p class="back">&#x2190; <a href="/">Back to rexarski.com</a></p>
          <p class="intro"><strong>This is a web feed</strong> (RSS). Copy the feed address below into your newsreader to subscribe.</p>
          <p class="intro">New to feeds? <a href="https://aboutfeeds.com/">About Feeds</a> — it’s free!</p>

          <div class="card">
            <h1><xsl:value-of select="rss/channel/title"/></h1>
            <p class="tagline"><xsl:value-of select="rss/channel/description"/></p>

            <div class="feed-url-wrap">
              <label for="feed-address">Feed address (copy to subscribe)</label>
              <input type="url" id="feed-address" spellcheck="false" readonly="readonly">
                <xsl:attribute name="value"><xsl:value-of select="rss/channel/atom:link[@rel='self']/@href"/></xsl:attribute>
              </input>
            </div>
          </div>

          <div class="card">
            <h2>Recent items</h2>
            <ul class="item-list">
              <xsl:for-each select="rss/channel/item">
                <li>
                  <p class="item-title">
                    <a>
                      <xsl:attribute name="href"><xsl:value-of select="link"/></xsl:attribute>
                      <xsl:value-of select="title"/>
                    </a>
                  </p>
                  <p class="item-date">Published: <xsl:value-of select="pubDate"/></p>
                </li>
              </xsl:for-each>
            </ul>
          </div>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>

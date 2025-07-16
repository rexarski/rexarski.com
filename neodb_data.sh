#!/bin/bash

# Load environment variables from .env file
source .env

# Function to fetch data for a category with error handling
fetch_category_data() {
    local category=$1
    local output_file="./assets/data/${category}_in_progress.json"

    echo "Fetching ${category} data..."

    if curl -X 'GET' "https://neodb.social/api/me/shelf/progress?category=${category}&page=1" \
        -H 'accept: application/json' \
        -H "Authorization: Bearer $NEODB_BEARER_TOKEN" \
        -s -f | \
        jq '{data: [.data[] | {id: .item.id, title: .item.title, created_time: .created_time}]}' > "$output_file"; then
        echo "✓ Successfully fetched ${category} data"
    else
        echo "✗ Failed to fetch ${category} data"
        return 1
    fi
}

# Check if token is set
if [[ -z "$NEODB_BEARER_TOKEN" ]]; then
    echo "Error: NEODB_BEARER_TOKEN environment variable is not set"
    exit 1
fi

# Create data directory if it doesn't exist
mkdir -p ./assets/data

# Fetch data for all categories
categories=("book" "tv" "game")
for category in "${categories[@]}"; do
    fetch_category_data "$category"
done

echo "All data fetching completed!"
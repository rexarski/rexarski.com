#!/bin/bash

# Concept2 Logbook Scraper
# Scrapes lifetime meters from Concept2 logbook profile and saves to JSON file

set -e  # Exit on any error

# Configuration
CONCEPT2_URL="https://log.concept2.com/profile/2691778"
DATA_DIR="data"
CONCEPT2_JSON_FILE="$DATA_DIR/concept2_distance.json"
TEMP_FILE="/tmp/concept2_data.html"

# Function to scrape Concept2 data
scrape_concept2_data() {
    echo "Scraping Concept2 logbook data from: $CONCEPT2_URL" >&2

    # Download the page
    curl -s "$CONCEPT2_URL" > "$TEMP_FILE"

    if [ ! -s "$TEMP_FILE" ]; then
        echo "Error: Failed to download Concept2 page"
        exit 1
    fi

    # Extract the lifetime meters value
    # The value appears in <div class="stat__figure"><span>267,322</span></div>
    # followed by <div class="stat__name">Lifetime Meters</div>
    LIFETIME_METERS=$(grep -A15 "stat__figure" "$TEMP_FILE" | grep -A15 -B5 "Lifetime Meters" | grep -o '<span>[0-9,]\+</span>' | head -1 | sed 's/<span>//;s/<\/span>//')

    if [ -z "$LIFETIME_METERS" ]; then
        echo "Error: Could not find lifetime meters value on the page"
        echo "Page content preview:"
        head -20 "$TEMP_FILE"
        exit 1
    fi

    # Remove commas and convert to integer
    LIFETIME_METERS_INT=$(echo "$LIFETIME_METERS" | tr -d ',')

    echo "Found lifetime meters: $LIFETIME_METERS (converted to: $LIFETIME_METERS_INT)" >&2

    # Clean up temp file
    rm -f "$TEMP_FILE"

    echo "$LIFETIME_METERS_INT"
}

# Function to save Concept2 data to JSON file
save_to_json() {
    local meters="$1"
    local temp_file="/tmp/concept2_json_temp"

    echo "Saving Concept2 data to JSON file: $CONCEPT2_JSON_FILE"

    # Create data directory if it doesn't exist
    mkdir -p "$DATA_DIR"

    # Create JSON structure
    cat > "$temp_file" << EOF
{
  "lifetime_meters": $meters,
  "last_updated": "$(date -u +"%Y-%m-%dT%H:%M:%SZ")",
  "source_url": "$CONCEPT2_URL"
}
EOF

    # Move the temp file to the final location
    mv "$temp_file" "$CONCEPT2_JSON_FILE"

    echo "Successfully saved Concept2 data to $CONCEPT2_JSON_FILE"
}

# Main execution
main() {
    echo "Starting Concept2 logbook scraper..."

    # Check if required tools are available
    if ! command -v curl &> /dev/null; then
        echo "Error: curl is required but not installed"
        exit 1
    fi

    if ! command -v grep &> /dev/null; then
        echo "Error: grep is required but not installed"
        exit 1
    fi

    # Scrape the data
    METERS=$(scrape_concept2_data)

    # Save to JSON file
    save_to_json "$METERS"

    echo "Concept2 scraper completed successfully!"
    echo "Lifetime meters saved to JSON: $METERS"
}

# Run main function
main "$@"

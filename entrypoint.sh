#!/bin/sh
set -e

API="https://translate-z.paca74.ddns.net/"

validate() {
    if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
        echo "Error: Missing required arguments."
        echo "Usage: docker run -v \$(pwd):/app image <api_key> <project_id> <language_id> [format]"
        exit 1
    fi
}

make_request() {
    echo "Fetching translations for project ${PROJECT_ID} (${LANGUAGE_ID})..."
    
    curl -s -X GET "${API}api/get-translations/${PROJECT_ID}/${LANGUAGE_ID}?format=${FORMAT}" \
         -H "Authorization: Bearer ${API_KEY}" \
         -o "${OUTPUT_FILE}"
}

main() {
    API_KEY=$1
    PROJECT_ID=$2
    LANGUAGE_ID=$3
    FORMAT=${4:-json}

    validate "$API_KEY" "$PROJECT_ID" "$LANGUAGE_ID"

    EXT=$(echo "$FORMAT" | tr '[:upper:]' '[:lower:]')
    OUTPUT_FILE="/app/${LANGUAGE_ID}.${EXT}"

    make_request "${API_KEY}" "${PROJECT_ID}" "${LANGUAGE_ID}" "${FORMAT}"

    echo "Saved successfully to ${OUTPUT_FILE}"
}

main "$@"
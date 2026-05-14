#!/bin/bash

FILE="$1"

if [[ -z "$FILE" ]]; then
  echo "No file"
  exit 1
fi

if [[ -z "$GOFILE_API_KEY" ]]; then
  echo "Missing API key"
  exit 1
fi

RESPONSE=$(curl -s -X POST "https://api.gofile.io/contents/uploadfile" \
  -H "Authorization: Bearer $GOFILE_API_KEY" \
  -F "file=@$FILE")

echo "$RESPONSE" | jq

echo "$RESPONSE" | jq -r '.data.downloadPage'

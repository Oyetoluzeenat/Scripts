#!/bin/bash

# Source and destination directories
SOURCE_DIR="source_file"
DEST_DIR="json_and_CSV"

# Create destination directory if it doesn't exist
mkdir -p "$DEST_DIR"

# Move CSV and JSON files
mv "$SOURCE_DIR"/*.csv "$DEST_DIR"
mv "$SOURCE_DIR"/*.json "$DEST_DIR"

# # Output a message indicating completion
echo "CSV and JSON files have been moved to $DEST_DIR."

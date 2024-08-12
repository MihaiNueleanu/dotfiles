#!/bin/bash

# Path to the file where clipboard contents will be stored
OUTPUT_FILE="$HOME/mac_share/clipboard.txt"

# Get the current clipboard content
CURRENT_CLIP=$(pbpaste)

# Get the last saved clipboard content
LAST_SAVED_CLIP=$(tail -n 1 "$OUTPUT_FILE")

# Check if the current clipboard content is different from the last saved one
if [ "$CURRENT_CLIP" != "$LAST_SAVED_CLIP" ]; then
    # If different, append the current clipboard content to the file with a timestamp
    echo $CURRENT_CLIP > "$OUTPUT_FILE"
fi

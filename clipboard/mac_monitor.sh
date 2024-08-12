#!/bin/bash

# Path to the shared clipboard file
OUTPUT_FILE="$HOME/mac_share/clipboard.txt"

# Infinite loop to continuously monitor clipboard and file changes
while true; do
    # Get the current clipboard content
    CURRENT_CLIP=$(pbpaste)

    # Get the last saved clipboard content from the file
    LAST_SAVED_CLIP=$(cat "$OUTPUT_FILE")

    # Check if the current clipboard content is different from the last saved one in the file
    if [ "$CURRENT_CLIP" != "$LAST_SAVED_CLIP" ]; then
        # Update the shared file with the current clipboard content
        echo "$CURRENT_CLIP" > "$OUTPUT_FILE"
    fi

    # Check if the file has been updated by Linux (i.e., if file content is different from the clipboard)
    if [ "$LAST_SAVED_CLIP" != "$CURRENT_CLIP" ]; then
        # Update macOS clipboard with the latest content from the file
        echo "$LAST_SAVED_CLIP" | pbcopy
    fi

    # Sleep for a short time to prevent excessive CPU usage
    sleep 1
done

#!/bin/bash

# Path to the shared clipboard file
SHARED_CLIPBOARD_FILE="/mnt/macos_shared/clipboard.txt"

# Monitor the shared file for changes
inotifywait -m -e close_write "$SHARED_CLIPBOARD_FILE" |
while read -r filename event; do
    # Get the last line of the clipboard file
    CLIP_CONTENT=$(tail -n 1 "$SHARED_CLIPBOARD_FILE")

    # Copy the new clipboard content to the Linux clipboard
    echo "$CLIP_CONTENT" | xclip -selection clipboard
done

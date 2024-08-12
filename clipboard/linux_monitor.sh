#!/bin/bash

# Path to the shared clipboard file
SHARED_CLIPBOARD_FILE="/mnt/macos_shared/clipboard.txt"

# Function to monitor the clipboard and file changes
monitor_clipboard_and_file() {
    while true; do
        # Get the current Linux clipboard content
        CURRENT_CLIP=$(xclip -o -selection clipboard)

        # Get the last saved clipboard content from the file
        LAST_SAVED_CLIP=$(cat "$SHARED_CLIPBOARD_FILE")

        # If the clipboard content has changed, update the file
        if [ "$CURRENT_CLIP" != "$LAST_SAVED_CLIP" ]; then
            echo "$CURRENT_CLIP" > "$SHARED_CLIPBOARD_FILE"
        fi

        # If the file content has changed, update the Linux clipboard
        if [ "$LAST_SAVED_CLIP" != "$CURRENT_CLIP" ]; then
            echo "$LAST_SAVED_CLIP" | xclip -selection clipboard
        fi

        # Sleep for a short time to prevent excessive CPU usage
        sleep 1
    done
}

# Start monitoring in the background
monitor_clipboard_and_file &

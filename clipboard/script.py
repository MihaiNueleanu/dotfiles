import os
import time
import platform
import pyperclip
from datetime import datetime

# Path to the shared clipboard file
SHARED_CLIPBOARD_FILE = "/mnt/mac_share/clipboard.txt"
if platform.system() == "Darwin":
    SHARED_CLIPBOARD_FILE = "/Users/ran/mac_share/clipboard.txt"

def read_shared_clipboard():
    """Reads the clipboard content and timestamp from the shared file."""
    if not os.path.exists(SHARED_CLIPBOARD_FILE):
        return "", ""
    
    with open(SHARED_CLIPBOARD_FILE, 'r') as file:
        lines = file.readlines()
        if len(lines) >= 2:
            timestamp = lines[0].strip()
            content = ''.join(lines[1:]).strip()
            return timestamp, content
        else:
            return "", ""

def write_shared_clipboard(content):
    """Writes the clipboard content and the current timestamp to the shared file."""
    timestamp = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
    with open(SHARED_CLIPBOARD_FILE, 'w') as file:
        file.write(f"{timestamp}\n{content}\n")

def get_clipboard_content():
    """Gets the current content of the clipboard."""
    return pyperclip.paste()

def set_clipboard_content(content):
    """Sets the clipboard content."""
    pyperclip.copy(content)

def main():
    last_clipboard_content = ""
    last_file_timestamp = ""

    while True:
        # Step 1: Read the shared clipboard file
        file_timestamp, file_clipboard_content = read_shared_clipboard()

        # Step 2: Get the current clipboard content
        current_clipboard_content = get_clipboard_content()

        # Step 3: If clipboard has new content, update the shared file
        if current_clipboard_content != last_clipboard_content:
            print(f"Detected new clipboard content at {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
            write_shared_clipboard(current_clipboard_content)
            last_clipboard_content = current_clipboard_content

        # Step 4: If the shared file has been updated by the other system, update the local clipboard
        if file_timestamp != last_file_timestamp and file_clipboard_content != current_clipboard_content:
            print(f"Updating clipboard with content from {file_timestamp}")
            set_clipboard_content(file_clipboard_content)
            last_clipboard_content = file_clipboard_content
            last_file_timestamp = file_timestamp

        # Sleep for a short period to avoid excessive CPU usage
        time.sleep(1)

if __name__ == "__main__":
    main()

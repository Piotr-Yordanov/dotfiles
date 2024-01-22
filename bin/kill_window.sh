#!/bin/bash

# Check if xdotool is installed
if ! command -v xdotool &>/dev/null; then
    echo "Please install xdotool first. (e.g., 'sudo apt-get install xdotool')"
    exit 1
fi

# Check if the window title is provided as an argument
if [ -z "$1" ]; then
    echo "Usage: $0 <window_title>"
    exit 1
fi

# Get the window ID using xdotool
WINDOW_ID=$(xdotool search --name "$1" | head -n 1)
echo $WINDOW_ID

if [ -z "$WINDOW_ID" ]; then
    echo "Window with title '$1' not found."
else
    # Use i3-msg to kill the window
    i3-msg "[id=${WINDOW_ID}] kill"
fi

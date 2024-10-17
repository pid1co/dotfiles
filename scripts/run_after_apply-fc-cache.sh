#!/bin/bash

# Directory to watch
FONT_DIR="$HOME/.local/share/fonts"

# Check if the fonts directory exists and has new or modified files
if [ -d "$FONT_DIR" ]; then
    # Run fc-cache to update font cache
    echo "Running fc-cache to update the font cache..."
    fc-cache -fv >/dev/null
fi

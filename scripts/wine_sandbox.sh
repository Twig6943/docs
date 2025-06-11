#!/bin/bash

# This was made because the winetricks' sandbox option seems to not work inside flatpak/umu environment.

# Define wineprefix
WINEPREFIX=~/PlaceholderPrefix

# Define username
USER_NAME="${USER:-$(id -un)}"
USER_DIR="$WINEPREFIX/drive_c/users/$USER_NAME"

# Ensure the prefix exists
if [ ! -d "$WINEPREFIX" ]; then
    echo "Error: WINEPREFIX $WINEPREFIX does not exist."
    exit 1
fi

# Remove the Z: drive to sandbox Wine from accessing the rest of the filesystem
echo "Removing Z: drive..."
rm -f "$WINEPREFIX/dosdevices/z:"

# Remove symlinks to real user folders and replace them with empty directories
echo "Isolating home directories..."

declare -a folders=(
  "AppData/Roaming/Microsoft/Windows/Templates"
  "Documents"
  "Music"
  "Videos"
  "Desktop"
  "Pictures"
  "Downloads"
)

for folder in "${folders[@]}"; do
    TARGET="$USER_DIR/$folder"
    echo "Resetting $TARGET"
    rm -f "$TARGET"
    mkdir -p "$TARGET"
done

# Delete the registry entry
WINEPREFIX="$WINEPREFIX" wine reg delete "HKLM\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Desktop\\Namespace\\{9D20AAE8-0625-44B0-9CA7-71889C2254D9}" /f

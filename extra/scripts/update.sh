#!/bin/bash

echo "======== System Update Started: $(date) ========"

# Update APT packages
echo ">> Updating APT packages..."
sudo apt update && sudo apt upgrade -y

# Remove unnecessary packages and clean up
echo ">> Cleaning up unused packages..."
sudo apt autoremove -y
sudo apt autoclean

# Update Snap packages
if command -v snap &>/dev/null; then
  echo ">> Updating Snap packages..."
  sudo snap refresh
fi

# Update Flatpak packages
if command -v flatpak &>/dev/null; then
  echo ">> Updating Flatpak packages..."
  flatpak update -y
fi

# Refresh font cache if fonts exist
if [ -d "$HOME/.fonts" ] || [ -d "$HOME/.local/share/fonts" ]; then
  echo ">> Refreshing font cache..."
  fc-cache -fv
fi

echo "======== System Update Finished: $(date) ========"

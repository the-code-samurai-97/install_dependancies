#!/bin/bash

set -e # Exit immediately if a command exits with a non-zero status

# Update package list
sudo apt update -y

# Install required packages via apt
sudo apt install -y python3-pip ffmpeg p7zip-full jq poppler-utils fd-find ripgrep fzf zoxide imagemagick git gcc build-essential gitk
sudo apt install libfuse2
# Install required packages via snap
sudo snap install yazi --edge --classic
sudo snap install curl
sudo snap install --edge nvim --classic
sudo snap install ghostty --classic --edge
sudo snap install gh --classic --edge
sudo snap install gedit --classic --edge
# Clone LazyVim configuration
if [ ! -d "$HOME/.config/nvim" ]; then
  git clone https://github.com/the-code-samurai-97/lazyvim-config "$HOME/.config/nvim"
else
  echo "LazyVim configuration already exists. Skipping clone."
fi

# Install Fancy Git prompt
curl -sS https://raw.githubusercontent.com/diogocavilha/fancy-git/master/install.sh | sh

# Download and install JetBrains Mono Nerd Font
FONT_DIR="$HOME/.fonts"
FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/JetBrainsMono.zip"
FONT_ZIP="JetBrainsMono.zip"

wget "$FONT_URL" -O "$FONT_ZIP"
unzip -o "$FONT_ZIP" -d "$FONT_DIR"
rm "$FONT_ZIP"
fc-cache -fv # Refresh font cache

# Install Brave Browser
curl -fsS https://dl.brave.com/install.sh | sh

echo "Installation complete!"

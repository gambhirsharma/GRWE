#!/bin/bash

# Define your GitHub repository URL
CONFIG_REPO="https://github.com/gambhirsharma/GRWE.git"

# Clone the repository to a temporary directory
TEMP_DIR=$(mktemp -d)
git clone "$CONFIG_REPO" "$TEMP_DIR"

# Backup and move Neovim configuration
if [ -d "$HOME/.config/nvim" ]; then
    mv "$HOME/.config/nvim" "$HOME/.config/nvim.bak"
    mkdir -p "$HOME/.config/nvim"
else
    mkdir -p "$HOME/.config/nvim"
fi
mv "$TEMP_DIR/nvim/" "$HOME/.config/"


# Backup and move Tmux configuration
if [ -f "$HOME/.tmux.conf" ]; then
    mv "$HOME/.tmux.conf" "$HOME/.tmux.conf.bak"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
mv "$TEMP_DIR/.tmux.conf" "$HOME/.tmux.conf" 

# Clean up the temporary directory
rm -rf "$TEMP_DIR"

echo "Neovim and Tmux configuration setup complete!"

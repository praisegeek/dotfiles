#!/bin/bash

set -e

echo "🔧 Setting up Neovim + Tmux config..."

# Unpack to home directory
unzip dotfiles.zip -d ~/

# Neovim
brew install neovim # or use your package manager

# FVM for Flutter
brew install fvm

# Node, Python, Rust (treesitter, mason, tsserver, etc.)
brew install node python rust

# Tmux
brew install tmux

# Install packer.nvim
if [ ! -d "~/.local/share/nvim/site/pack/packer/start/packer.nvim" ]; then
  echo "📦 Installing packer.nvim..."
  git clone --depth 1 https://github.com/wbthomason/packer.nvim \
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim
fi

# Setup TPM
if [ ! -d "$HOME/.config/tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm $HOME/tmux/plugins/tpm
fi

$HOME/tmux/plugins/tmp/bin/install_plugins

# Alias vim to nvim
if ! grep -q "alias vim='nvim'" ~/.bashrc; then
  echo "alias vim='nvim'" >> ~/.bashrc
  echo "✅ Added alias to ~/.bashrc"
fi

if [ -f ~/.zshrc ] && ! grep -q "alias vim='nvim'" ~/.zshrc; then
  echo "alias vim='nvim'" >> ~/.zshrc
  echo "✅ Added alias to ~/.zshrc"
fi

# Tmux session
chmod +x $HOME/.config/tmux-session

# Install Nerd Font (FiraCode) instruction
echo ""
echo "🎨 For best experience, download and set FiraCode Nerd Font from https://www.nerdfonts.com/font-downloads"
echo ""

# Launch nvim to sync plugins
echo "🚀 Launching Neovim to install plugins..."
nvim +PackerSync

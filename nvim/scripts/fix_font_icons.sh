#!/bin/bash
# filepath: /home/tag/.config/nvim/scripts/fix_font_icons.sh

echo "===== Fixing Neovim Font and Icon Issues ====="

# 1. Check if the font is installed
if ! fc-list | grep -i "RobotoMono" | grep -i "Nerd" > /dev/null; then
  echo "ⓘ RobotoMono Nerd Font not found in system fonts"
  echo "  Installing font..."
  
  # Create font directory if it doesn't exist
  mkdir -p ~/.local/share/fonts
  
  # Download and install the font
  cd ~/.local/share/fonts
  if [ ! -f RobotoMono.zip ]; then
    curl -fLO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/RobotoMono.zip
    unzip RobotoMono.zip
    rm RobotoMono.zip
    fc-cache -fv
  fi
fi

# 2. Clear Neovim cache to ensure changes take effect
echo "ⓘ Clearing Neovim cache..."
rm -rf ~/.local/state/nvim
rm -rf ~/.local/share/nvim/lazy/lazy.nvim

# 3. Final message
echo "ⓘ Font and icon fixes have been applied!"
echo "  Please restart Alacritty and Neovim to see the changes."
echo "  You can run the font check script to verify: ~/.config/nvim/scripts/check_font.sh"
echo "===== Fix Complete ====="

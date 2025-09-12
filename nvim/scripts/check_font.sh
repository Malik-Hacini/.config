#!/bin/bash
# filepath: /home/tag/.config/nvim/scripts/check_font.sh
# A script to check font configuration and test nerd font icons

echo "===== Font Configuration Check ====="
echo ""

# Terminal font check
echo "Terminal Font Detection:"
if [ "$TERM" == "alacritty" ]; then
  echo "✓ Alacritty terminal detected"
  if [ -f "$HOME/.config/alacritty/alacritty.toml" ]; then
    echo "✓ Alacritty config found at: $HOME/.config/alacritty/alacritty.toml"
    FONT_NAME=$(grep -A1 "family =" "$HOME/.config/alacritty/alacritty.toml" | grep "RobotoMono" | head -1)
    if [ ! -z "$FONT_NAME" ]; then
      echo "✓ RobotoMono Nerd Font configured in Alacritty"
    else
      echo "✗ RobotoMono Nerd Font not found in Alacritty config"
    fi
  else
    echo "✗ Alacritty config not found"
  fi
else
  echo "ℹ Non-Alacritty terminal detected: $TERM"
fi

# Font installation check
echo ""
echo "Font Installation Check:"
if fc-list | grep -i "RobotoMono" | grep -i "Nerd" > /dev/null; then
  echo "✓ RobotoMono Nerd Font found in system fonts"
  echo "  Font paths:"
  fc-list | grep -i "RobotoMono" | grep -i "Nerd" | cut -d: -f1
else
  echo "✗ RobotoMono Nerd Font not found in system fonts"
  echo "  Consider reinstalling the font with: "
  echo "  $ mkdir -p ~/.local/share/fonts"
  echo "  $ cd ~/.local/share/fonts && curl -fLO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/RobotoMono.zip"
  echo "  $ unzip RobotoMono.zip && rm RobotoMono.zip"
  echo "  $ fc-cache -fv"
fi

# Neovim configuration check
echo ""
echo "Neovim Configuration Check:"
if [ -f "$HOME/.config/nvim/lua/neotex/config/options.lua" ]; then
  FONT_CONFIG=$(grep "guifont" "$HOME/.config/nvim/lua/neotex/config/options.lua")
  echo "Current guifont setting: $FONT_CONFIG"
  if echo "$FONT_CONFIG" | grep -i "RobotoMono" > /dev/null; then
    echo "✓ RobotoMono configured in Neovim"
  else
    echo "✗ RobotoMono not configured in Neovim"
  fi
else
  echo "✗ Neovim options.lua not found"
fi

# Icon test
echo ""
echo "Nerd Font Icon Test:"
echo "The following icons should appear as proper symbols, not boxes or Chinese characters:"
echo ""
echo "  Folder:      "
echo "  File:        "
echo "  PDF:         "
echo "  Close:       "
echo "  Git:         "
echo "  Warning:     "
echo "  Error:       "
echo "  Info:        "
echo "  Branch:      "
echo ""
echo "If any of these appear as boxes or Chinese characters, your terminal may not be"
echo "correctly configured to use the Nerd Font."
echo ""
echo "===== End of Font Check ====="

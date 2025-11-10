#!/bin/zsh

# dotfile target: ~/.zlogin

echo "--"
if [[ -r ~/repos/tvogels01/quotes/quotes ]]; then
  fortune ~/repos/tvogels01/quotes/quotes
else
  fortune
fi
echo "--"

export DOTFILES_LOADED_ZLOGIN=$SHLVL

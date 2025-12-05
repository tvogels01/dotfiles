#!/bin/zsh

# dotfile target: ~/.zlogin

if [[ "$(tty)" == "not a tty" ]]; then
  echo "            DIAL TONE DETECTED... CARRIER ESTABLISHED"
elif [[ -r ~/repos/tvogels01/quotes/quotes ]]; then
  fortune ~/repos/tvogels01/quotes/quotes
else
  fortune
fi
echo "--"

export DOTFILES_LOADED_ZLOGIN=$SHLVL

#!/bin/zsh

# dotfile target: ~/.zlogin

if [[ "$(tty)" == "not a tty" ]]; then
  true 
elif [[ -r ~/repos/tvogels01/quotes/quotes ]]; then
  echo "--"
  fortune ~/repos/tvogels01/quotes/quotes
  echo "--"
else
  echo "--"
  fortune
  echo "--"
fi

export DOTFILES_LOADED_ZLOGIN=$SHLVL

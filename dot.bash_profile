#!/bin/bash

# dotfile target: ~/.bash_profile

# Shared PATH tweaks live in ~/.dotfiles_path (sourced via ~/.bashrc).

# Completions
for f in /opt/homebrew/etc/bash_completion.d/*; do
  source $f
done

# Command Aliases
if [ -r ~/.aliases ]; then
  source ~/.aliases
fi

# E.g. for HOMEBREW_GITHUB_API_TOKEN
if [ -r ~/.private/keys ]; then
  source ~/.private/keys
fi

# Basic Bash
source ~/.bashrc

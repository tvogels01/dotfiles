#!/bin/bash

# target: ~/.bash_profile

# Update brewed path
PATH=/opt/homebrew/bin:/opt/homebrew/sbin:$PATH

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

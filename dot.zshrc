#!/bin/zsh

# dotfile target: ~/.zshrc

# Better late than never.
if [ -z "$DOTFILES_LOADED_ZPROFILE" ]; then
  [ -r ~/.zprofile ] && source ~/.zprofile
fi

# Use VI keybindings!
bindkey -v
set -o vi
export EDITOR=vim

# When you are too lazy for "Esc /"
bindkey "^R" history-incremental-search-backward

export GREP_COLOR="auto"

# PATH customizations (shared with other shells)
if [ -r ~/.dotfiles_path ]; then
  source ~/.dotfiles_path
fi
typeset -U path PATH

# Smarter "cd"
setopt auto_cd
cdpath=(~/repos/*)

# Surely this won't annoy me
setopt correct

# The following lines were added by compinstall
zstyle :compinstall filename ~/.zshrc
autoload -Uz compinit
compinit
# End of lines added by compinstall

# Aliases shared across shells
if [ -r ~/.aliases ]; then
  source ~/.aliases
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt append_history
setopt share_history
# End of lines configured by zsh-newuser-install
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt inc_append_history

# Allow '#' in interactive shell
setopt interactivecomments

# Begin of vcs_info: Adding version control info to prompt
setopt prompt_subst
setopt prompt_percent

autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' check-for-changes true
# Default: " (%s)-[%b]%u%c-"
zstyle ':vcs_info:git:*' formats '%F{green}%b%f%F{red}%u%c%f'
# Default: " (%s)-[%b|%a]%u%c-"
zstyle ':vcs_info:git:*' actionformats '%s-%a %F{green}%b%f%F{red}%u%c%f'

if [ -n "$SSH_CLIENT" ]; then
  PROMPT="[\$vcs_info_msg_0_] %F{blue}%n@%m%f %F{cyan}%2~%f %# "
else
  PROMPT="[\$vcs_info_msg_0_] %F{cyan}%2~%f %# "
fi
# End of vcsinfo

# Zsh Line Editor (zshzle)
ZLE_RPROMPT_INDENT=1

export DOTFILES_LOADED_ZSHRC=$SHLVL

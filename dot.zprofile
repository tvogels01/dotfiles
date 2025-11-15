#!/bin/zsh

# dotfile target: ~/.zprofile

# If you are wondering why these settings might be missing, you might have
# accidentally started a non-login shell, e.g. with `exec zsh`.
# Next time, try `exec zsh --login` instead.

# BEGIN eval "$(/opt/homebrew/bin/brew shellenv)"
export HOMEBREW_PREFIX="/opt/homebrew";
export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
export HOMEBREW_REPOSITORY="/opt/homebrew";
fpath[1,0]="/opt/homebrew/share/zsh/site-functions";
eval "$(/usr/bin/env PATH_HELPER_ROOT="/opt/homebrew" /usr/libexec/path_helper -s)"
[ -z "${MANPATH-}" ] || export MANPATH=":${MANPATH#:}";
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";
# END eval "$(/opt/homebrew/bin/brew shellenv)"

export DOTFILES_LOADED_ZPROFILE=$SHLVL

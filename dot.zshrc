#!/bin/zsh

# dotfile target: ~/.zshrc

bindkey -v
set -o vi
export EDITOR=vim
export GREP_COLOR="auto"

# See Brewfile for specific versions
typeset -U path
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}"
export PATH="/opt/homebrew/opt/node@16/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@14/bin:$PATH"

if [ -r ~/.aliases ]; then
  source ~/.aliases
fi

# Some scripts are broken in /usr/local/share/zsh/site-functions ?
for f in \
  /opt/homebrew/share/zsh/site-functions/_aws \
  /opt/homebrew/share/zsh/site-functions/_gh \
  /opt/homebrew/share/zsh/site-functions/_lein \
; do
  test -f "$f" && source "$f"
done

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename ~/.zshrc
autoload -Uz compinit
compinit
# End of lines added by compinstall

# Adding version control info
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%s:%b:%u%c'
zstyle ':vcs_info:*' check-for-changes true

setopt PROMPT_SUBST
RPROMPT=\$vcs_info_msg_0_

# Prelim:
#   brew install miniconda
#   conda init "$(basename "${SHELL}")" #=> see below

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Prelim:
#    conda create --name code
test -d /opt/homebrew/Caskroom/miniconda/base/envs/code && conda activate code

export DOTFILES_LOADED_ZSHRC=$SHLVL

#!/bin/zsh

# dotfile target: ~/.zshrc

bindkey -v

# See Brewfile for specific versions
typeset -U path
path+="/opt/homebrew/bin"
path+="/opt/homebrew/opt/postgresql@14/bin"
path+="/opt/homebrew/opt/openjdk@11/bin"
path+="/opt/homebrew/opt/node@16/bin"
path+="/opt/homebrew/sbin"

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

set -o vi
export EDITOR=vim
export GREP_COLOR="auto"

# source /opt/intel/mkl/bin/mklvars.sh intel64 ilp64
# source /opt/intel/mkl/bin/mklvars.sh

# Prelim:
#   brew install miniconda
#   conda init "$(basename "${SHELL}")"

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

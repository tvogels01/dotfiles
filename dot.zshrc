#!/bin/zsh

# dotfile target: ~/.zshrc

bindkey -v

# See Brewfile for specific versions
export PATH="/usr/local/opt/postgresql@14/bin:$PATH"
export PATH="/usr/local/opt/openjdk@11/bin:$PATH"
export PATH="/usr/local/opt/node@16/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

if [ -r ~/.aliases ]; then
  source ~/.aliases
fi

# Some scripts are broken in /usr/local/share/zsh/site-functions ?
for f in \
  /usr/local/share/zsh/site-functions/_aws \
  /usr/local/share/zsh/site-functions/_gh \
  /usr/local/share/zsh/site-functions/_lein \
; do
  source $f
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
__conda_setup="$('/usr/local/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Prelim:
#    conda create --name code
test -d /usr/local/Caskroom/miniconda/base/envs/code && conda activate code

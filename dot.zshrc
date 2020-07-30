# target: ~/.zshrc

# /usr/local/share/zsh/site-functions

bindkey -v

# see Brewfile for specific versions
export PATH="/usr/local/opt/postgresql@11/bin:$PATH"
export PATH="/usr/local/opt/openjdk@11/bin:$PATH"
export PATH="/usr/local/opt/node@12/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

# download/pin a specific version
export PATH="/usr/local/opt/terraform/bin:$PATH"

alias ll='ls -alF'
alias mv='mv -i'
alias rm='rm -i'
alias ..='\cd ..'

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '/Users/thomasvogels/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall

# source /opt/intel/mkl/bin/mklvars.sh intel64 ilp64
# source /opt/intel/mkl/bin/mklvars.sh


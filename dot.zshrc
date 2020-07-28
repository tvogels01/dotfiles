# target: ~/.zshrc

# /usr/local/share/zsh/site-functions

bindkey -v

export PATH="/usr/local/opt/openjdk@11/bin:$PATH"
export PATH="/usr/local/opt/node@12/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

alias ll='ls -alF'
alias ..='\cd ..'

# source /opt/intel/mkl/bin/mklvars.sh intel64 ilp64
# source /opt/intel/mkl/bin/mklvars.sh

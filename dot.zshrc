# target: ~/.zshrc

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

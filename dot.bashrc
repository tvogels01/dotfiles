# target: ~/.bashrc

set -o vi
export EDITOR=vim

alias la='ls -A'
alias ll='ls -Al'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias h='history'

alias od='/Applications/Xcode.app/Contents//Developer/usr/bin/opendiff'

export GREP_COLOR="auto"

if [ type __git_ps1 > /dev/null 2>&1 ]; then
  export PS1='\w$(__git_ps1 " (%s)") \$ '
else
  export PS1='\h:\W \u\$ '
fi

# HOMEBREW_GITHUB_API_TOKEN
if [ -r ~/.private/keys ]; then
  source ~/.private/keys
fi

source ~/etc/psql_completion.sh

# complete -C '/usr/local/bin/aws_completer' aws

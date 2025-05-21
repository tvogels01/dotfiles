#!/bin/bash

# dotfile target: ~/.bashrc

set -o vi
export EDITOR=vim

export GREP_COLOR="auto"

if [ type __git_ps1 > /dev/null 2>&1 ]; then
  export PS1='\w$(__git_ps1 " (%s)") \$ '
else
  export PS1='\h:\W \u\$ '
fi

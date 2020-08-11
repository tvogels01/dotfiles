# Update brewed path
PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Completions
for f in /usr/local/etc/bash_completion.d/*; do
  source $f
done

# Basic Bash
source ~/.bashrc

# Python
export WORKON_HOME=~/Envs
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
source /usr/local/bin/virtualenvwrapper_lazy.sh

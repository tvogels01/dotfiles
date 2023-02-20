# target: ~/.bash_profile

# Update brewed path
PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Completions
for f in /usr/local/etc/bash_completion.d/*; do
  source $f
done

# Command Aliases
if [ -r ~/.aliases ]; then
  source ~/.aliases
fi

# E.g. for HOMEBREW_GITHUB_API_TOKEN
if [ -r ~/.private/keys ]; then
  source ~/.private/keys
fi

# Basic Bash
source ~/.bashrc

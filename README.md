# dotfiles

_Basic setup files and setup instructions_

These are the configuration files that I'm using on my computers.

## Getting Started

### Additional Software on macOS

See [Brewfile](./Brewfile) to install basic software.

### Git

Git configuration:
```shell
git config --global user.name "My Name Here"
git config --global user.email "my_email@example.com"
```

See also [dot.gitconfig\_base](./dot.gitconfig_base).

### "Installation"

Until I whip up something fancier:
```shell
cp dot.aliases ~/.alises
cp dot.bash_profile ~/.bash_profile
cp dot.bashrc ~/.bashrc
cp dot.gitconfig_base ~/.gitconfig_base
cp dot.psqlrc ~/.psqlrc
cp dot.screenrc ~/.screenrc
cp dot.vimrc ~/.vimrc
cp dot.zshrc ~/.zshrc
```

## Renaming `master` to `main`

Use the GitHub UI, then:
```shell
git branch -m master main
git fetch origin
git branch -u origin/main main
git remote set-head origin -a
```

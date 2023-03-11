# dotfiles

_Basic setup files and setup instructions_

These are the configuration files and settings that I'm using on my computers.

## Getting Started

### Additional Software on macOS

See [Brewfile](./Brewfile) to install basic software.

```shell
brew bundle
```

### Conda

```shell
brew install conda
conda update conda
conda create -n code
```

### Git

Git configuration:
```shell
git config --global user.name "My Name Here"
git config --global user.email "my_email@example.com"
```

See also [dot.gitconfig\_base](./dot.gitconfig_base).

### "Installation"

Until I whip up something fancier (assuming you organize your clones in `~/repos/owner/name`):
```shell
ln -s ~/repos/tvogels01/dotfiles/dot.aliases          ~/.aliases
ln -s ~/repos/tvogels01/dotfiles/dot.bash_logout      ~/.bash_logout
ln -s ~/repos/tvogels01/dotfiles/dot.bash_profile     ~/.bash_profile
ln -s ~/repos/tvogels01/dotfiles/dot.bashrc           ~/.bashrc
ln -s ~/repos/tvogels01/dotfiles/dot.condarc          ~/.condarc
ln -s ~/repos/tvogels01/dotfiles/dot.editorconfig     ~/.editorconfig
ln -s ~/repos/tvogels01/dotfiles/dot.gitconfig_base   ~/.gitconfig_base
ln -s ~/repos/tvogels01/dotfiles/dot.gitignore_global ~/.gitignore_global
ln -s ~/repos/tvogels01/dotfiles/dot.psqlrc           ~/.psqlrc
ln -s ~/repos/tvogels01/dotfiles/dot.sreenrc          ~/.sreenrc
ln -s ~/repos/tvogels01/dotfiles/dot.vimrc            ~/.vimrc
ln -s ~/repos/tvogels01/dotfiles/dot.zlogin           ~/.zlogin
ln -s ~/repos/tvogels01/dotfiles/dot.zlogout          ~/.zlogout
ln -s ~/repos/tvogels01/dotfiles/dot.zprofile         ~/.zprofile
ln -s ~/repos/tvogels01/dotfiles/dot.zshrc            ~/.zshrc
```

## Visual Studio Code extensions

Search in their market place:
```shell
jq -r < ~/.vscode/extensions/extensions.json '.[].relativeLocation'  | sort
```
```text
amazonwebservices.aws-toolkit-vscode-1.63.0
betterthantomorrow.calva-2.0.335
github.copilot-1.77.9225
ms-azuretools.vscode-docker-1.24.0
ms-ossdata.vscode-postgresql-0.3.0
ms-python.isort-2022.8.0
ms-python.python-2023.4.0
ms-python.vscode-pylance-2023.3.10
ms-toolsai.jupyter-2023.2.1000592019
ms-toolsai.jupyter-keymap-1.1.0
ms-toolsai.jupyter-renderers-1.0.15
ms-toolsai.vscode-jupyter-cell-tags-0.1.6
ms-toolsai.vscode-jupyter-slideshow-0.1.5
ms-vscode.live-server-0.4.6
vscodevim.vim-1.25.2
```

## Updating

```
brew bundle
conda update conda
```

Also try: `softwareupdate --list`

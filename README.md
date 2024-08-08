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
brew install miniconda
conda create --name code
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
ln -s ~/repos/tvogels01/dotfiles/dot.screenrc          ~/.screenrc
ln -s ~/repos/tvogels01/dotfiles/dot.vimrc            ~/.vimrc
ln -s ~/repos/tvogels01/dotfiles/dot.zlogin           ~/.zlogin
ln -s ~/repos/tvogels01/dotfiles/dot.zlogout          ~/.zlogout
ln -s ~/repos/tvogels01/dotfiles/dot.zprofile         ~/.zprofile
ln -s ~/repos/tvogels01/dotfiles/dot.zshrc            ~/.zshrc
```

## Visual Studio Code

### Settings

Add to `~/Library/Application\ Support/Code/User/settings.json`:
```json
{
    "editor.formatOnSave": true,
    "editor.inlineSuggest.enabled": true,
    "editor.minimap.enabled": false,
    "files.autoSave": "onFocusChange",
    "files.insertFinalNewline": true,
    "files.trimFinalNewlines": true,
    "python.defaultInterpreterPath": "/usr/local/Caskroom/miniconda/base/envs/code",
    "settingsSync.ignoredExtensions": [],
    "terminal.integrated.inheritEnv": false,
    "workbench.editor.tabCloseButton": "left",
    "[python]": {
        "editor.formatOnType": true
    }
}
```

### Extensions

Search in their market place:
```shell
code --list-extensions --show-versions | sort
```
```text
amazonwebservices.amazon-q-vscode@1.3.0
amazonwebservices.aws-toolkit-vscode@3.2.0
betterthantomorrow.calva-spritz@1.0.5
betterthantomorrow.calva@2.0.452
elmtooling.elm-ls-vscode@2.8.0
esbenp.prettier-vscode@10.4.0
github.copilot-chat@0.15.1
github.copilot@1.190.0
github.vscode-pull-request-github@0.88.1
hbenl.vscode-test-explorer@2.21.1
ms-azuretools.vscode-docker@1.29.1
ms-ossdata.vscode-postgresql@0.3.0
ms-python.debugpy@2024.6.0
ms-python.isort@2023.10.1
ms-python.python@2024.6.0
ms-python.vscode-pylance@2024.5.1
ms-toolsai.jupyter-keymap@1.1.2
ms-toolsai.jupyter-renderers@1.0.17
ms-toolsai.jupyter@2024.4.0
ms-toolsai.vscode-jupyter-cell-tags@0.1.9
ms-toolsai.vscode-jupyter-slideshow@0.1.6
ms-vscode.live-server@0.4.13
ms-vscode.test-adapter-converter@0.1.9
orta.vscode-jest@6.2.5
redhat.java@1.30.0
rheller.alive@0.4.4
usernamehw.errorlens@3.17.0
vscjava.vscode-java-debug@0.57.0
vscjava.vscode-java-test@0.41.1
vscodevim.vim@1.27.2
```

## Updating

```
brew bundle
conda update --all
```

Also try: `softwareupdate --list`

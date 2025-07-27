# dotfiles

_Basic setup files and setup instructions_ <!-- markdownlint-disable MD036 -->

These are the configuration files and settings that I'm using on my computers.
Use at [your own risk](./LICENSE).

## Getting Started

### Add Software on macOS

See [Brewfile](./Brewfile) to install basic software using [`brew`](https://brew.sh).

```shell
brew bundle
```

### Add Conda

```shell
brew install miniconda

conda config --add channels defaults
conda config --add channels conda-forge
conda config --set channel_priority strict

conda create --name code
```

(Anything drops into `code` unless I pick a specific environment for a project.)

### Configure Git

Git configuration:

```shell
git config --global user.name "My Name Here"
git config --global user.email "my_email@example.com"
```

See also [dot.gitconfig\_base](./dot.gitconfig_base).

### "Installation" of dot files

Until I whip up something fancier, you can run (assuming you organize your clones in `~/repos/owner/name`):

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

Search in their market place (for either `code` or `cursor`):

```shell
code --list-extensions --show-versions | sort
```

```text
amazonwebservices.amazon-q-vscode@1.71.0
amazonwebservices.aws-toolkit-vscode@3.64.0
astro-build.astro-vscode@2.15.4
christian-kohler.npm-intellisense@1.4.5
davidanson.vscode-markdownlint@0.60.0
dbaeumer.vscode-eslint@3.0.10
editorconfig.editorconfig@0.17.4
esbenp.prettier-vscode@11.0.0
github.copilot-chat@0.27.3
github.copilot@1.331.0
github.vscode-pull-request-github@0.110.0
hbenl.vscode-test-explorer@2.22.1
mongodb.mongodb-vscode@1.13.3
ms-azuretools.vscode-containers@2.0.3
ms-ossdata.vscode-pgsql@1.4.2
ms-python.debugpy@2025.8.0
ms-python.isort@2025.0.0
ms-python.python@2025.6.1
ms-python.vscode-pylance@2025.5.1
ms-toolsai.jupyter-keymap@1.1.2
ms-toolsai.jupyter-renderers@1.1.0
ms-toolsai.jupyter@2025.4.1
ms-toolsai.vscode-jupyter-cell-tags@0.1.9
ms-toolsai.vscode-jupyter-slideshow@0.1.6
ms-vscode.test-adapter-converter@0.2.1
orta.vscode-jest@6.4.3
usernamehw.errorlens@3.26.0
visualstudioexptteam.intellicode-api-usage-examples@0.2.9
visualstudioexptteam.vscodeintellicode@1.3.2
vscodevim.vim@1.30.1
wallabyjs.console-ninja@1.0.451
```

## Updating

### Updating the `Brewfile`

Start with:

```shell
brew bundle dump --describe --file=Brewfile.new
```

### Updating versions

```shell
brew bundle
conda update --all
```

Also try: `softwareupdate --list`

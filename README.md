# dotfiles

_Basic setup files and setup instructions_ <!-- markdownlint-disable MD036 -->

These are the configuration files and settings that I'm using on my computers.
Use at [your own risk](./LICENSE).

## Getting Started

### Add Software on macOS

See the Brew bundles to install software using [`Homebrew`](https://brew.sh):

```shell
brew bundle                         # Core CLI + runtimes (Brewfile)
brew bundle --file=Brewfile.dev     # Optional languages, DBs, utilities
brew bundle --file=Brewfile.apps    # GUI + Mac App Store apps
```

`Brewfile.apps` includes [`mas`](https://github.com/mas-cli/mas) entries (e.g., Xcode); remove any you do not want before running the bundle.
Capture the exact versions you installed with `brew bundle lock --file=<bundle>`.

### Add Conda

Install miniconda and create a default environment `code`.

```shell
brew install miniconda

conda create --name code
conda activate code
```

Anything drops into `code` unless I pick a specific environment for a project.
Make sure that `dot.condarc` is already linked to from `~/.condarc`.
The shell now loads Conda's activation hook lazily, so the first `conda`/`activate` command may take a moment while the hook initializes, but interactive startup stays fast.

### Configure Git

Git configuration:

```shell
git config --global user.name "My Name Here"
git config --global user.email "my_email@example.com"
```

See also [dot.gitconfig\_base](./dot.gitconfig_base).

### "Installation" of dot files

From the repo root run:

```shell
./bootstrap.sh
```

The script detects where it lives, links each `dot.*` file into `$HOME`, and backs up any conflicting files into `~/.dotfiles_backup/<timestamp>`. If you want to preview the actions, add `--dry-run`.

PATH customizations live in [`dot.dotfiles_path`](./dot.dotfiles_path); edit that file to add or remove directories once it is linked to `~/.dotfiles_path`.

If you prefer to create links manually, use the commands below (assuming your clone lives under `~/repos/owner/name`):

```shell
ln -s ~/repos/tvogels01/dotfiles/dot.aliases          ~/.aliases
ln -s ~/repos/tvogels01/dotfiles/dot.bash_logout      ~/.bash_logout
ln -s ~/repos/tvogels01/dotfiles/dot.bash_profile     ~/.bash_profile
ln -s ~/repos/tvogels01/dotfiles/dot.bashrc           ~/.bashrc
ln -s ~/repos/tvogels01/dotfiles/dot.condarc          ~/.condarc
ln -s ~/repos/tvogels01/dotfiles/dot.duckdbrc         ~/.duckdbrc
ln -s ~/repos/tvogels01/dotfiles/dot.editorconfig     ~/.editorconfig
ln -s ~/repos/tvogels01/dotfiles/dot.gitconfig_base   ~/.gitconfig_base
ln -s ~/repos/tvogels01/dotfiles/dot.gitignore_global ~/.gitignore_global
ln -s ~/repos/tvogels01/dotfiles/dot.dotfiles_path    ~/.dotfiles_path
ln -s ~/repos/tvogels01/dotfiles/dot.psqlrc           ~/.psqlrc
ln -s ~/repos/tvogels01/dotfiles/dot.screenrc         ~/.screenrc
ln -s ~/repos/tvogels01/dotfiles/dot.vimrc            ~/.vimrc
ln -s ~/repos/tvogels01/dotfiles/dot.zlogin           ~/.zlogin
ln -s ~/repos/tvogels01/dotfiles/dot.zlogout          ~/.zlogout
ln -s ~/repos/tvogels01/dotfiles/dot.zprofile         ~/.zprofile
ln -s ~/repos/tvogels01/dotfiles/dot.zshrc            ~/.zshrc
ln -s ~/repos/tvogels01/dotfiles/ssh_config           ~/.ssh/config
```

### Quick environment activation

After sourcing `~/.aliases`, an `activate` helper is available. Run it in any project directory to:

1. Execute `nvm use` if a `.nvmrc` file is present.
2. Activate the Conda environment whose name matches the current folder (if it exists).
3. Source `.venv/bin/activate` when a local Python virtualenv is available.

Both NVM and Conda hooks are loaded on demand the first time you use `nvm`, `node`, `npm`, or `conda`, keeping shell startup latency low.

### Conda workflow tips

1. Create a named environment (shared default is `code`):
   ```shell
   conda create --name <project> python=3.12
   ```
2. Inside the project folder run `activate` to enter the matching Conda env automatically.
3. Capture dependencies:
   ```shell
   conda env export --from-history > environment.yml
   ```
4. Exit with `conda deactivate` (the helper does not auto-deactivate).

Projects that prefer `python -m venv` can still use `.venv/bin/activate` and skip Conda entirely.

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

Search in their market place (for either `code` or `cursor`).

```shell
code --list-extensions --show-versions | sort
```

See `Brewfile.vscode` as an alternative.

## Updating

### Updating the `Brewfile`

Start with:

```shell
brew bundle dump --describe --file=Brewfile.new
```

Then merge `Brewfile.new` with the existing `Brewfile`.

### Updating versions

```shell
brew update
./brew_upgrade_all.sh
```

Also check for untracked (and outdated) software:

```shell
brew bundle cleanup
```

```shell
conda update --all
```

Also try: `softwareupdate --list`

## macOS tweaks

Run [`set_macos_defaults.sh`](./set_macos_defaults.sh) to apply favorite defaults (Dock position, alert sounds, speech voice). The script runs `defaults write` commands with `set -euo pipefail`, prints each change, restarts the Dock, and reminds you of manual checklist items (FileVault, Bluetooth, etc.). Pass `--help` to see usage.

## SSH configuration

Link [`ssh_config`](./ssh_config) to `~/.ssh/config` (see Installation above). The default entry keeps EC2 instances alive and logs in as `ec2-user`. Add host-specific overrides below that block and keep permissions strict (`chmod 600 ~/.ssh/config`). Pair this with per-host keys in `~/.ssh` and `ssh-add -K ~/.ssh/<key>` as needed.

## Workflow cheatsheet

[`CHEATSHEET.md`](./CHEATSHEET.md) summarizes the most common commands:

- `activate` helper order of operations (`nvm use` → `conda activate <cwd>` → `.venv`)
- `brew bundle`, `./brew_upgrade_all.sh`, and lockfile tips
- Conda/Jupyter workflows, VS Code reminders, and SSH config usage

Update the cheat sheet whenever workflows change so onboarding stays accurate.

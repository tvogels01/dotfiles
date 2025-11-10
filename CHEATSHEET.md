# Cheatsheet

## `conda`

```shell
conda create --name code 
conda info --envs

conda search
conda list
```

More at [cheatsheet.html](https://conda.io/projects/conda/en/latest/user-guide/cheatsheet.html)

## `nvm` to manage Node.js versions

Start with the latest (LTS) version of `Node.js`
after installing [`nvm`](https://github.com/nvm-sh/nvm)
using `brew bundle`:

```shell
nvm install --lts
nvm use --lts --save
```

Verify latest versions (and that `nvm` is being used):

```shell
type node
node --version
```

Leverage the new `.nvmrc` file:

```shell
nvm use
```

## `npm` and TypeScript

Install latest versions of `npm`, TypeScript, and
a [runner](https://nodejs.org/en/learn/typescript/run):

```shell
npm install --global npm@latest
npm --version
```

```shell
npm install --global typescript tsx
tsc --version
```

## Jupyter Lab VIM

Make sure the matching `conda` environment is active.

```shell
conda install jupyterlab
pip install jupyterlab-vim
```

See [`jupyterlab-vim`](https://pypi.org/project/jupyterlab-vim/).

## Visual Studio Code

* [Install command line tools](https://code.visualstudio.com/docs/setup/mac#_launching-from-the-command-line)

## `activate` helper

Works from any project directory after `~/.aliases` is sourced:

```shell
activate   # runs nvm use -> conda activate <cwd> -> source .venv/bin/activate
```

You will see the commands echoed when Conda or a `.venv` activates; `nvm use` retains its default output.

## Brew bundles

```shell
brew bundle                         # Core CLI + runtimes (Brewfile)
brew bundle --file=Brewfile.dev     # Optional languages, DBs, utilities
brew bundle --file=Brewfile.apps    # GUI + MAS apps
./brew_upgrade_all.sh               # Upgrade every bundle sequentially
brew bundle lock --file=Brewfile    # Capture exact versions (repeat per bundle)
```

## SSH

```shell
ln -s ~/repos/tvogels01/dotfiles/ssh_config ~/.ssh/config
chmod 600 ~/.ssh/config
```

Add host overrides below the default EC2 block. Use unique keys per host and run `ssh-add -K ~/.ssh/<key>` to cache them in the keychain.

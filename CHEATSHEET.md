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

Start with the latest (LTS) version of Node.js
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

```shell
conda install jupyterlab
pip install jupyterlab-vim
```

See [`jupyterlab-vim`](https://pypi.org/project/jupyterlab-vim/).

## Visual Studio Code

* [Install command line tools](https://code.visualstudio.com/docs/setup/mac#_launching-from-the-command-line)

# TODO

We are about to give this dotfiles repo some overdue TLC, so this checklist will track each focused improvement as we iterate.

| Status | Topic | Notes |
| --- | --- | --- |
| [x] | Automate dotfile bootstrap | Added `bootstrap.sh` with backups + README docs; manual commands kept as fallback. |
| [x] | Clean PATH initialization | Added shared `.dotfiles_path`, sourced from Bash/Zsh with dedup + proper `$HOME` expansion. |
| [x] | Add `activate` helper | Added shared shell function handling `.nvmrc`, Conda `<cwd>` envs, and `.venv` activations. |
| [x] | Optimize shell startup | Lazy-load nvm & conda, expanded history settings, and documented the behavior. |
| [x] | Restructure Brew bundles | Split into `Brewfile`, `Brewfile.dev`, `Brewfile.apps` (with `mas`) and documented usage. |
| [x] | Harden macOS defaults script | Added `set -euo pipefail`, usage docs, and clearer `defaults` logging/checklist. |
| [x] | Enrich documentation | README + cheat sheet now cover Conda tips, activate helper, SSH config, brew upgrades. |

## Working Instructions

1. Always pick the first row whose status is `[ ]`.
2. Do the work, validate it, and record any relevant notes or decisions inline.
3. Flip the status to `[x]` only after the task is fully complete.

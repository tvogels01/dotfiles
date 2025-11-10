# TODO

We are about to give this dotfiles repo some overdue TLC, so this checklist will track each focused improvement as we iterate.

| Status | Topic | Notes |
| --- | --- | --- |
| [ ] | Automate dotfile bootstrap | Replace manual `ln -s` steps with a safe script or stow/chezmoi setup. |
| [ ] | Clean PATH initialization | Deduplicate PATH edits and ensure `$HOME` is expanded consistently across shells. |
| [ ] | Optimize shell startup | Lazy-load nvm/conda, expand history settings, and revisit prompt tweaks. |
| [ ] | Restructure Brew bundles | Separate core/optional taps, consider `mas` apps, and document usage patterns. |
| [ ] | Harden macOS defaults script | Add strict bash flags, document required privileges, and verify changes. |
| [ ] | Enrich documentation | Capture workflows (VS Code, Conda, SSH) and keep cheatsheets in sync. |

## Working Instructions

1. Always pick the first row whose status is `[ ]`.
2. Do the work, validate it, and record any relevant notes or decisions inline.
3. Flip the status to `[x]` only after the task is fully complete.

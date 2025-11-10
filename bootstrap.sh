#!/usr/bin/env bash

set -euo pipefail

usage() {
  cat <<'EOF'
Usage: bootstrap.sh [--dry-run]

Create symlinks from this repository into your home directory, backing up
any conflicting files the first time they are replaced. Run from anywhere;
the script discovers its own location.

Options:
  -n, --dry-run   Show the operations that would be performed without
                  touching the filesystem.
  -h, --help      Show this help message and exit.
EOF
}

DRY_RUN=false

while [[ $# -gt 0 ]]; do
  case "$1" in
    -n|--dry-run)
      DRY_RUN=true
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown option: $1" >&2
      usage >&2
      exit 1
      ;;
  esac
done

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="${SCRIPT_DIR}"
HOME_DIR="${HOME}"
BACKUP_ROOT="${DOTFILES_BACKUP_DIR:-$HOME_DIR/.dotfiles_backup}"
TIMESTAMP="$(date +%Y%m%d-%H%M%S)"
ACTIVE_BACKUP_DIR=""

declare -a LINK_TARGETS=(
  "dot.aliases:.aliases"
  "dot.bash_logout:.bash_logout"
  "dot.bash_profile:.bash_profile"
  "dot.bashrc:.bashrc"
  "dot.condarc:.condarc"
  "dot.duckdbrc:.duckdbrc"
  "dot.editorconfig:.editorconfig"
  "dot.gitconfig_base:.gitconfig_base"
  "dot.gitignore_global:.gitignore_global"
  "dot.psqlrc:.psqlrc"
  "dot.screenrc:.screenrc"
  "dot.vimrc:.vimrc"
  "dot.zlogin:.zlogin"
  "dot.zlogout:.zlogout"
  "dot.zprofile:.zprofile"
  "dot.zshrc:.zshrc"
)

log() {
  printf '%s\n' "$*"
}

ensure_backup_dir() {
  if [[ -z "$ACTIVE_BACKUP_DIR" ]]; then
    ACTIVE_BACKUP_DIR="$BACKUP_ROOT/$TIMESTAMP"
    if [[ "$DRY_RUN" == false ]]; then
      mkdir -p "$ACTIVE_BACKUP_DIR"
    else
      log "[dry-run] mkdir -p $ACTIVE_BACKUP_DIR"
    fi
  fi
}

backup_destination() {
  local dest="$1"
  local rel
  if [[ "$dest" == "$HOME_DIR/"* ]]; then
    rel="${dest#$HOME_DIR/}"
  else
    rel="$(basename "$dest")"
  fi
  printf '%s/%s' "$ACTIVE_BACKUP_DIR" "$rel"
}

link_file() {
  local source_rel dest_rel source_file dest_file
  source_rel="${1%%:*}"
  dest_rel="${1##*:}"
  source_file="$DOTFILES_DIR/$source_rel"
  dest_file="$HOME_DIR/$dest_rel"

  if [[ ! -e "$source_file" ]]; then
    log "Skipping missing source: $source_rel"
    return
  fi

  if [[ -L "$dest_file" ]]; then
    local existing
    existing="$(readlink "$dest_file")"
    if [[ "$existing" == "$source_file" ]]; then
      log "Already linked: ~$dest_rel"
      return
    fi
  fi

  if [[ -e "$dest_file" || -L "$dest_file" ]]; then
    ensure_backup_dir
    local backup_path
    backup_path="$(backup_destination "$dest_file")"
    local backup_dir
    backup_dir="$(dirname "$backup_path")"
    if [[ "$DRY_RUN" == false ]]; then
      mkdir -p "$backup_dir"
      mv "$dest_file" "$backup_path"
      log "Backed up $dest_file -> $backup_path"
    else
      log "[dry-run] mv $dest_file $backup_path"
    fi
  fi

  local dest_parent
  dest_parent="$(dirname "$dest_file")"
  if [[ "$DRY_RUN" == false ]]; then
    mkdir -p "$dest_parent"
    ln -s "$source_file" "$dest_file"
  fi
  log "$([[ $DRY_RUN == true ]] && printf '[dry-run] ')"'ln -s '"$source_file $dest_file"
}

for target in "${LINK_TARGETS[@]}"; do
  link_file "$target"
done

if [[ -n "$ACTIVE_BACKUP_DIR" ]]; then
  log "Existing files moved to: $ACTIVE_BACKUP_DIR"
fi

log "Done."

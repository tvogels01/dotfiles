#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

usage() {
  cat <<'EOF'
Upgrade every Brew bundle tracked in this repo.

Usage:
  ./brew_upgrade_all.sh

Runs `brew bundle upgrade --file=<bundle>` for:
  - Brewfile
  - Brewfile.dev (if present)
  - Brewfile.apps (if present)
EOF
}

if [[ "${1-}" == "-h" || "${1-}" == "--help" ]]; then
  usage
  exit 0
elif [[ $# -gt 0 ]]; then
  echo "Unknown argument: $1" >&2
  usage >&2
  exit 1
fi

command -v brew >/dev/null 2>&1 || {
  echo "Homebrew is not installed or not in PATH." >&2
  exit 1
}

for bundle in Brewfile Brewfile.dev Brewfile.apps; do
  if [[ -f "$bundle" ]]; then
    echo "==> Upgrading using $bundle"
    brew bundle upgrade --file="$bundle"
  else
    echo "==> Skipping $bundle (file not found)"
  fi
done

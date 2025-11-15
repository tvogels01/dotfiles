#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

# Run from repo root regardless of invocation directory
repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
cd "$repo_root"

shopt -s nullglob
brewfiles=(Brewfile Brewfile.*)
shopt -u nullglob

filtered=()
for file in "${brewfiles[@]}"; do
  [[ -f "$file" ]] || continue
  case "$file" in
    *.lock|*.lock.*) continue ;;
  esac
  filtered+=("$file")
done

if (( ${#filtered[@]} == 0 )); then
  echo "No Brewfiles found next to $0" >&2
  exit 1
fi

aggregate="$(mktemp "${TMPDIR:-/tmp}/brew-bundle.XXXXXX")"
trap 'rm -f "$aggregate"' EXIT

echo "Aggregating ${#filtered[@]} Brewfile(s):"
for file in "${filtered[@]}"; do
  echo "  - $file"
  cat "$file" >> "$aggregate"
  printf '\n' >> "$aggregate"
done

echo
printf 'Running: %s\n' "brew bundle cleanup --file $aggregate $*"
brew bundle cleanup --file "$aggregate" "$@"

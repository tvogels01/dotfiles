#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

usage() {
  cat <<'EOF'
Apply favorite macOS defaults. Requires:
  * macOS with `defaults`, `osascript`, and `killall`
  * Ability to run `sudo` for privileged settings (prompted when needed)

Usage:
  ./set_macos_defaults.sh
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

echo "Applying macOS defaults..."

run_defaults() {
  local domain="$1"
  shift
  echo "  defaults write $domain $*"
  defaults write "$domain" "$@"
}

# System sound
run_defaults "Apple Global Domain" "com.apple.sound.beep.sound" "/System/Library/Sounds/Submarine.aiff"

# Dock
run_defaults "com.apple.dock" orientation -string "left"
run_defaults "com.apple.dock" minimize-to-application -bool true

# Speech voice (requires voice to be downloaded beforehand)
run_defaults "com.apple.speech.synthesis.general.prefs" "SelectedVoiceCreator" -int 875705394
run_defaults "com.apple.speech.synthesis.general.prefs" "SelectedVoiceID" -int 662631907
run_defaults "com.apple.speech.synthesis.general.prefs" "SelectedVoiceName" -string "Allison (Enhanced)"

echo "Restarting Dock..."
killall Dock >/dev/null 2>&1 || true

echo "Done. Review TODO items in this script for manual follow-ups."

cat <<'TODO'

Remaining manual tweaks:
  - General: try "Auto" appearance.
  - Desktop & Screen Saver: dynamic desktop, Drift screensaver (5 min), top-right hot corner.
  - Dock & Menu Bar: show Bluetooth (off), show Time Machine.
  - Mission Control: disable auto rearrange spaces.
  - Siri: disallow when locked.
  - Notifications: turn on Do Not Disturb.
  - Security & Privacy: require password after 5s, ensure FileVault + Firewall (stealth) on.
  - Bluetooth: turn off, show in menu bar.
  - Sound: reduce alert volume, show in menu bar.
  - Keyboard: turn off backlight after 5s.
  - Trackpad: enable App Exposé.
  - Display: enable Night Shift.
  - Battery: prevent sleep on power adapter.
  - iCloud Drive: sync Desktop + Documents.
TODO

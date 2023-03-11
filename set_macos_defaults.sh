# Settings preferences directly
set -x

# The "submarine ping" is a much nicer "you ding dong!" sound.
defaults write "Apple Global Domain" "com.apple.sound.beep.sound" "/System/Library/Sounds/Submarine.aiff"

# Wide screens deservers the Dock on the left.
defaults write com.apple.dock orientation left
defaults write com.apple.dock minimize-to-application 1

# Download "Allison (Enhanced)" first:
#     SelectedVoiceCreator = 875705394;
#     SelectedVoiceID = 662631907;
#     SelectedVoiceName = "Allison (Enhanced)";
#
# Only on desktop: defaults write com.apple.speech.synthesis.general.prefs TalkingAlertsSpeakTextFlag 1

# TODO(tom):
# * General
#     * Try out “Auto” (or go back to “Dark”?)
# * Desktop & Screen Saver
#     * Test “dynamic” desktop that changes throughout the day
#     * Use “Drift” screensaver, start after 5 minutes
#     * Use “top right” as hot corner for starting the screensaver
# * Dock & Menu Bar
#     * Bluetooth: show in menubar, off by default
#     * Time Machine: show in menubar
# * Mission Control
# 	* Turn off “automatically rearrange spaces…”
# * Siri
#     * Do not allow to use Siri when locked
# * Notifications
#     * Turn on “do not disturb”
# * Security & Privacy
#     * Require password after 5 seconds
#     * Make sure FileVault is turned on
#     * Turn on Firewall
#         * Enable Stealth Mode
# * Bluetooth
#     * Turn it off
#     * Show Bluetooth in menu bar
# * Sound
#     * Reduce volume of alerts
#     * Show volume in menu bar
# * Keyboard
# 	* Turn off backlight after 5 secs
# * Trackpad
#     * Turn on App Expose
# * (Built-in Retina) Display
#     * Turn on Night Shift
# * Battery
# 	* When on Power adapter, do not automatically go to sleep
# * Internet Accounts
#     * iCloud -> make sure that Desktop and Documents is selected in iCloud Drive

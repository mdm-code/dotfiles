#!/usr/bin/env bash

# This is the startup script for MACOS
# The file `com.startup.plist` is copied to /Library/LaunchAgents
# and loaded permanently using `sudo launchctl load -w /Library/LaunchAgents/com.startup.plist`.
# To stop the service from running on startup, replace `load` with `unload` in the command above.

brew services start spacebar
brew services start yabai
sudo yabai --load-sa
brew services start skhd
sudo launchctl load "/Library/LaunchDaemons/org.pqrs.karabiner.karabiner_grabber.plist" 2>/dev/null
sudo launchctl load "/Library/LaunchDaemons/org.pqrs.karabiner.karabiner_observer.plist" 2>/dev/null
launchctl enable gui/"$UID"/org.pqrs.karabiner.karabiner_console_user_server
launchctl bootstrap gui/"$UID" /Library/LaunchAgents/org.pqrs.karabiner.karabiner_console_user_server.plist 2>/dev/null
launchctl enable gui/"$UID"/org.pqrs.karabiner.karabiner_console_user_server

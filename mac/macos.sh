




# Dock

defaults write com.apple.dock "orientation" -string "bottom"
defaults write com.apple.dock "tilesize" -int 16
defaults write com.apple.dock "autohide" -bool "true"
defaults write com.apple.dock "autohide-time-modifier" -float "0"
defaults write com.apple.dock "autohide-delay" -float "0"
defaults write com.apple.dock "show-recents" -bool "false"
defaults write com.apple.dock "mineffect" -string "suck"
defaults write com.apple.dock "static-only" -bool "true"

killall Dock


# Screenshots
mkdir ~/Screenshots

defaults write com.apple.screencapture "disable-shadow" -bool "true" 
defaults write com.apple.screencapture "include-date" -bool "true" 
defaults write com.apple.screencapture "location" -string "~/Screenshots"
defaults write com.apple.screencapture "show-thumbnail" -bool "false" 
defaults write com.apple.screencapture "type" -string "jpg" 

killall SystemUIServer

# Safari

defaults write com.apple.safari "ShowFullURLInSmartSearchField" -bool "true"
killall Safari


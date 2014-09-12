echo "Installing press and hold app bindings..."
defaults write -g ApplePressAndHoldEnabled -bool true
# TODO autodetect default keyboard
# defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources | egrep -w 'KeyboardLayout Name' | sed -E 's/^.+ = \"?([^\"]+)\"?;$/\\1/'
sudo mv /System/Library/Input\ Methods/PressAndHold.app/Contents/Resources/Keyboard-et.plist ~/Downloads/Keyboard-et.backup.plist
sudo ln -s ~/.dotfiles/Keyboard-et.plist /System/Library/Input\ Methods/PressAndHold.app/Contents/Resources/Keyboard-et.plist
echo "Complete."
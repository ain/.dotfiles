# .dotfiles

My various dotfiles for Mac OS X Yosemite and upwards.

## Dependencies

- [terminal-notifier](https://github.com/alloy/terminal-notifier)

## Installation

1. Make sure the following files are backed up, if applicable:
  - `~/.gitignore`
  - `~/.bash_profile`
  - `~/.tmux.conf`
2. Run `./install.sh`

## Tips

| File | Tip |
|---------|-----|
| Keyboard-et.plist | `defaults write -g ApplePressAndHoldEnabled -bool true; sudo rm /System/Library/Input\ Methods/PressAndHold.app/Contents/Resources/Keyboard-et.plist; sudo ln -s ~/.dotfiles/Keyboard-et.plist /System/Library/Input\ Methods/PressAndHold.app/Contents/Resources/Keyboard-et.plist` |
# .dotfiles

My various dotfiles for Mac OS X Yosemite and upwards.

## Tips

| dotfile | Tip |
|---------|-----|
| .gitignore | Global .gitignore. Set with `git config --global core.excludesfile '~/.gitignore'` |
| .bash_profile | `ln -s ~/.dotfiles/.bash_profile ~/.bash_profile` |
| Keyboard-et.plist | `defaults write -g ApplePressAndHoldEnabled -bool true; sudo rm /System/Library/Input\ Methods/PressAndHold.app/Contents/Resources/Keyboard-et.plist; sudo ln -s ~/.dotfiles/Keyboard-et.plist /System/Library/Input\ Methods/PressAndHold.app/Contents/Resources/Keyboard-et.plist` |
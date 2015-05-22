#!/bin/bash

echo "Installing dotfiles..."

# Working directory
PWD=`pwd`

echo "  installing Bash profile "
unlink ~/.bash_profile
ln -s $PWD/.bash_profile ~/.bash_profile

echo "  installing tmux configuration "
unlink ~/.tmux.conf
ln -s $PWD/.tmux.conf ~/.tmux.conf

echo "  installing global Git ignore configuration "
unlink ~/.gitignore
ln -s $PWD/.gitignore ~/.gitignore

echo "  populating generic Git configuration "
git config --global core.excludesfile ~/.gitignore
# TODO add "simple" pull/push directive

echo "  installing terminal-notifier "
gem install terminal-notifier

echo "  installing Composer descriptors "
mkdir -p ~/.composer
unlink ~/.composer/composer.json
unlink ~/.composer/composer.lock
ln -s $PWD/.composer/composer.json ~/.composer/composer.json
ln -s $PWD/.composer/composer.lock ~/.composer/composer.lock

echo "Installation complete!"
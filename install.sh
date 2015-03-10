echo "Installing dotfiles..."

PWD=`pwd`

echo "  installing global Git ignore configuration"
unlink ~/.gitignore
ln -s $PWD/.gitignore ~/.gitignore

echo "  installing Bash profile"
unlink ~/.bash_profile
ln -s $PWD/.bash_profile ~/.bash_profile

echo "  installing tmux configuration"
unlink ~/.tmux.conf
ln -s $PWD/.tmux.conf ~/.tmux.conf

echo "Installation complete!"
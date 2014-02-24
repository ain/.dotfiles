# Set XAMPP PHP instance
echo $PATH | grep -q -s "/php"
if [ $? -eq 1 ]; then
    PATH=/Applications/XAMPP/xamppfiles/bin:$PATH
    export PATH
fi

# enable console highlighting
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad

export PATH=/opt/local/bin:/opt/local/sbin:$PATH

# RVM
source ~/.rvm/scripts/rvm

alias ddu="du -h /Users/ain | grep \".*G\t\" >> ~/Downloads/my-folder-size-report-$(date +%Y%m%d%H%M%S).log"

[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh # This loads NVM

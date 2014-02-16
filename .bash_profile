# Set XAMPP PHP instance
echo $PATH | grep -q -s "/php"
if [ $? -eq 1 ]; then
    PATH=/Applications/XAMPP/xamppfiles/bin:$PATH
    export PATH
fi

# enable console highlighting
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad

export PATH=/opt/local/bin:/opt/local/sbin:$HOME/.rvm/bin:$PATH

alias ddu="du -h /Users/ain | grep \".*G\t\" >> ~/Downloads/my-folder-size-report-$(date +%Y%m%d%H%M%S).log"

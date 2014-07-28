# enable console highlighting
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad

alias ddu="du -h /Users/ain | grep \".*G\t\" >> ~/Downloads/my-folder-size-report-$(date +%Y%m%d%H%M%S).log"
alias lla="ls -la"
alias whereami="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active' | egrep -o -m 1 '^[^\t:]+' | xargs ipconfig getifaddr; curl ipecho.net/plain; echo"
alias cleanports="sudo port -f uninstall inactive; sudo port clean --all all; df -h"
alias spaceemergency="sudo rm -rf /var/vm/sleepimage"

cpuload() {
  for i in {1..20}; do
    yes > /dev/null &
  done
}

alias cpuload=cpuload
alias stopload="killall yes"


PATH=$PATH:$HOME/.drush # Add Drush to PATH for Drupal automation

# Set XAMPP PHP instance
echo $PATH | grep -q -s "/php"
if [ $? -eq 1 ]; then
    PATH=/Applications/XAMPP/xamppfiles/bin:$PATH
    export PATH
fi

export PATH=/opt/local/bin:/opt/local/sbin:$PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

[[ -s $HOME/.nvm/nvm.sh ]] && source "$HOME/.nvm/nvm.sh" # This loads NVM
nvm use 0.10 # loads latest Node 0.10.x
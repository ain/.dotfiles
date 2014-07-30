# enable console highlighting
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad

# Colors
ESC_SEQ="\x1b["
COL_RESET=$ESC_SEQ"39;49;00m"
COL_RED=$ESC_SEQ"31;01m"
COL_GREEN=$ESC_SEQ"32;01m"
COL_YELLOW=$ESC_SEQ"33;01m"
COL_BLUE=$ESC_SEQ"34;01m"
COL_MAGENTA=$ESC_SEQ"35;01m"
COL_CYAN=$ESC_SEQ"36;01m"

# Aliases
alias ddu="du -h /Users/ain | grep \".*G\t\" >> ~/Downloads/my-folder-size-report-$(date +%Y%m%d%H%M%S).log"
alias lla="ls -la"
alias whereami="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active' | egrep -o -m 1 '^[^\t:]+' | xargs ipconfig getifaddr; curl ipecho.net/plain; echo"
alias cleanports="sudo port -f uninstall inactive; sudo port clean --all all; df -h"
alias claimspace="sudo rm -rf /var/vm/sleepimage; cleanports"
alias lsusb="system_profiler SPUSBDataType"
alias sheload="source ~/.bash_profile; echo -e '$COL_GREEN Bash reloaded! $COL_RESET'"

epuload() {
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

[[ -s $HOME/.nvm/nvm.sh ]] && source "$HOME/.nvm/nvm.sh" # This loads NVM
nvm use 0.10 # loads latest Node 0.10.x

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
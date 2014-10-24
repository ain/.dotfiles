# enable console highlighting
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad

# Colors
ESC_SEQ="\x1b["
COL_RESET=$ESC_SEQ"39;49;00m"
COL_RED=$ESC_SEQ"0;31m"
COL_GREEN=$ESC_SEQ"0;32m"
COL_YELLOW=$ESC_SEQ"0;33m"
COL_BLUE=$ESC_SEQ"0;34m"
COL_MAGENTA=$ESC_SEQ"0;35m"
COL_CYAN=$ESC_SEQ"0;36m"

# Aliases
alias ddu="du -h /Users/ain | grep \".*G\t\" >> ~/Downloads/my-folder-size-report-$(date +%Y%m%d%H%M%S).log"
alias whereami="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active' | egrep -o -m 1 '^[^\t:]+' | xargs ipconfig getifaddr; curl ipecho.net/plain; echo"
alias cleanports="sudo port -f uninstall inactive; sudo port clean --all all; df -h"
alias lsusb="system_profiler SPUSBDataType"
alias sheload="source ~/.bash_profile; echo -e '$COL_GREEN Bash reloaded! $COL_RESET'"
alias cleancwd="rm -rf * .[0-9a-zA-Z]*"

cpuload() {
  for i in {1..20}; do
    yes > /dev/null &
  done
}

dupelines() {
  sort $1 | uniq -d
}

uniquelines() {
  sort $1 | uniq -u
}

# Extract lines from 2nd file that do not exist in 1st file
xdiff() {
  awk 'FNR==NR{old[$0];next};!($0 in old)' $1 $2 >> $3
}

# Claim space over emergency. Kill possible swaps etc.
claimspace() {
  sudo rm -rf /var/vm/sleepimage ~/.Trash/*
  if [[ $1 == "--full" ]]
  then
    cleanports
  fi
  df -h
  echo -e "$COL_GREEN Space claim complete! $COL_RESET"
}

alias cpuload=cpuload
alias stopload="killall yes"
alias dupelines=dupelines
alias uniquelines=uniquelines
alias xdiff=xdiff
alias claimspace=claimspace

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
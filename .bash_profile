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
alias ddu="du -h /Users/ain | grep \".*G\t\" > ~/Downloads/my-folder-size-report-$(date +%Y%m%d%H%M%S).log"
alias whereami="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active' | egrep -o -m 1 '^[^\t:]+' | xargs ipconfig getifaddr; curl ipecho.net/plain; echo"
alias cleanports="sudo port -f uninstall inactive; sudo port clean --all all; df -h"
alias lsusb="system_profiler SPUSBDataType"
alias cleancwd="rm -rf * .[0-9a-zA-Z]*"
alias stopload="killall yes"
alias fproc="ps aux | grep $1"
alias emptify="cat /dev/null > $1"
alias killcache="sudo killall -HUP mDNSResponder"
alias dockerwipe="docker system prune -a --volumes"

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
#
# Options to claim space from:
#  -d   Docker
#  -p   MacPorts
#
claimspace() {

  echo -e "$COL_BLUE Removing sleep image, emptying trash... $COL_RESET"
  sudo rm -rf ~/.Trash/*

  while getopts "dp" flag
  do
    case "$flag" in
      d)
        if hash docker 2>/dev/null; then
          echo -e "$COL_BLUE Claiming space from Docker... $COL_RESET"
          docker system prune -a --volumes

        else
          echo -e "$COL_RED Claiming space from Docker failed. Docker N/A. $COL_RESET"
        fi
        ;;
      p)
        echo -e "$COL_BLUE Claiming space from MacPorts... $COL_RESET"
        cleanports
        ;;
    esac
  done
  df -h
  echo -e "$COL_GREEN Space claim complete! $COL_RESET"
}

# Composer globals, e.g. Drush
export PATH="$HOME/.composer/vendor/bin:$PATH"

# MacPorts
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

# Fix tmux problem on macOS Sierra
export EVENT_NOKQUEUE=1

export PATH="~/Library/Python/3.6/bin:${PATH}"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.bash.inc" ]; then . "$HOME/google-cloud-sdk/path.bash.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.bash.inc" ]; then . "$HOME/google-cloud-sdk/completion.bash.inc"; fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# MacPorts Installer addition on 2020-12-02_at_01:05:43: adding an appropriate DISPLAY variable for use with MacPorts.
export DISPLAY=:0

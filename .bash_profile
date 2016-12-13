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
  sudo rm -rf /var/vm/sleepimage ~/.Trash/*

  while getopts "dp" flag
  do
    case "$flag" in
      d)
        if hash docker 2>/dev/null; then
          echo -e "$COL_BLUE Claiming space from Docker... $COL_RESET"
          dockerwipe

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

# Docker
dockerenv() {
  if [ -z $1 ]; then
    if [ -z $DOCKER_MACHINE_NAME ]; then
      echo -e "$COL_RED Argument for machine required! $COL_RESET"
    else
      docker-machine env $DOCKER_MACHINE_NAME
    fi
  else
    eval "$(docker-machine env $1)"
    echo -e "$COL_GREEN Docker environment set for $DOCKER_MACHINE_NAME $COL_RESET"
  fi
}

dockerwipe() {
  local readonly containers=`docker ps -aq`
  local readonly container_count=`echo "$containers" | wc -l | sed 's/[[:space:]]//g'`
  if [ -n "$containers" ]; then
    echo -e "$COL_BLUE Removing Docker containers ($container_count)... $COL_RESET"
    docker rm -fv $containers
  fi

  local readonly volumes=`docker volume ls -qf dangling=true`
  local readonly volume_count=`echo "$volumes" | wc -l | sed 's/[[:space:]]//g'`
  if [ -n "$containers" ]; then
    echo -e "$COL_BLUE Removing dangling Docker volumes ($volume_count)... $COL_RESET"
    docker volume rm $volumes
  fi

  local readonly images=`docker images --filter dangling=true -q`
  local readonly image_count=`echo "$images" | wc -l | sed 's/[[:space:]]//g'`
  if [ -n "$images" ]; then
    echo -e "$COL_BLUE Removing dangling Docker images ($image_count)... $COL_RESET"
    docker rmi $images
  fi

  echo -e "$COL_GREEN Docker wipe finished. Removed $container_count container(s), $volume_count volume(s), $image_count image(s). $COL_RESET"
}

dockersize() {
  docker-machine ssh $DOCKER_MACHINE_NAME 'sudo df -h'
}

tnotify() {
  terminal-notifier -message "$1" -title "$2" -activate com.apple.Terminal
}

if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
  . /opt/local/etc/profile.d/bash_completion.sh
fi
# Docker autocomplete
if [ -f /opt/local/etc/profile.d/docker-completion.sh ]; then
  . /opt/local/etc/profile.d/docker-completion.sh
fi
# Docker Compose autocomplete
if [ -f /opt/local/etc/profile.d/docker-compose-completion.sh ]; then
  . /opt/local/etc/profile.d/docker-compose-completion.sh
fi
# Docker Machine autocomplete
if [ -f /opt/local/etc/profile.d/docker-machine-completion.sh ]; then
  . /opt/local/etc/profile.d/docker-machine-completion.sh
fi

# Fix tmux problem on macOS Sierra
export EVENT_NOKQUEUE=1

[[ -s $HOME/.nvm/nvm.sh ]] && source "$HOME/.nvm/nvm.sh"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

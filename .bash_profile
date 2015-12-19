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

gitpr() {
  git ftch origin pull/$1/head:pr/$1 && git checkout pr/$1
}

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
  elif [ -z $2 ]; then
    echo -e "$COL_RED Argument for main container required! $COL_RESET"
  else
    eval "$(docker-machine env $1)"
    export DOCKER_MAIN_CONTAINER="$2"
    echo -e "$COL_GREEN Docker environment set for $DOCKER_MACHINE_NAME (main container $DOCKER_MAIN_CONTAINER). $COL_RESET"
  fi
}

dockerid() {
  local OPTIND
  local readonly namefilter="name=_${DOCKER_MAIN_CONTAINER}_"
  if [ $# -eq 0 ]; then
    docker ps -aq --filter=$namefilter | head -n 1
  else
    while getopts "r" flag
    do
      case "$flag" in
        r)
          docker ps -aq --filter=$namefilter --filter="status=running" | head -n 1;;
      esac
    done
  fi
}

dockerexec() {
  local readonly id=`dockerid -r`
  echo -e "$COL_BLUE Accessing container ${DOCKER_MAIN_CONTAINER} (${id})... $COL_RESET"
  if [ $# -eq 0 ]; then
    docker exec -it $id bash -l
  else
    docker exec -it $id "$@"
  fi
}

dockerrun() {
  echo -e "$COL_BLUE Running container ${DOCKER_MAIN_CONTAINER}... $COL_RESET"
  docker run -it `dockerid` "$@"
}

dockerbuild() {
  caffeinate docker-compose build "$@"
  echo -e "$COL_GREEN Docker build finished. $COL_RESET"
  tnotify 'Docker build finished!' 'Docker'
}

dockerwipe() {
  # TODO: DRY up.
  local readonly containers=`docker ps -aq`
  local readonly container_count=`docker ps -aq | wc -l | sed 's/[[:space:]]//g'`
  if [ -n "$containers" ]; then
    echo -e "$COL_BLUE Removing Docker containers ($container_count)... $COL_RESET"
    docker rm -v $containers
  fi

  local readonly images=`docker images --filter dangling=true -q`
  local readonly image_count=`docker images --filter dangling=true -q | wc -l | sed 's/[[:space:]]//g'`
  if [ -n "$images" ]; then
    echo -e "$COL_BLUE Removing dangling Docker images ($image_count)... $COL_RESET"
    docker rmi $images
  fi

  echo -e "$COL_GREEN Docker wipe finished. Removed $container_count container(s), $image_count image(s). $COL_RESET"
}

dockersize() {
  docker-machine ssh $DOCKER_MACHINE_NAME 'sudo df -h'
}

tnotify() {
  terminal-notifier -message "$1" -title "$2" -activate com.apple.Terminal
}

[[ -s $HOME/.nvm/nvm.sh ]] && source "$HOME/.nvm/nvm.sh"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

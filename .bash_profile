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
alias cleancwd="rm -rf * .[0-9a-zA-Z]*"

# MySQL
MYSQL_HOME=/opt/local/lib/mysql56
export PATH=$MYSQL_HOME/bin:$PATH
alias mysql_start="sudo $MYSQL_HOME/bin/mysqld_safe --local-infile=1 --user=root &"
alias mysql_stop="sudo $MYSQL_HOME/bin/mysqladmin shutdown"
alias mysqll="mysql --auto-rehash -u root -p"

# PostgreSQL
export PATH=/opt/local/lib/postgresql94/bin:$PATH
alias postgres_start='sudo /opt/local/etc/LaunchDaemons/org.macports.postgresql94-server/postgresql94-server.wrapper start';
alias postgres_stop='sudo /opt/local/etc/LaunchDaemons/org.macports.postgresql94-server/postgresql94-server.wrapper stop';
alias postgres_restart='sudo /opt/local/etc/LaunchDaemons/org.macports.postgresql94-server/postgresql94-server.wrapper restart';

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
# TODO implement levels
claimspace() {
  sudo rm -rf /var/vm/sleepimage ~/.Trash/*
  if hash docker 2>/dev/null; then
    echo -e "$COL_BLUE Claiming space from Docker... $COL_RESET"
    docker rm $(docker ps -a -q)
    docker rmi $(docker images --filter dangling=true -q)
  fi
  if [[ $1 == "--full" ]]; then
    echo -e "$COL_BLUE Claiming space from MacPorts... $COL_RESET"
    cleanports
  fi
  df -h
  echo -e "$COL_GREEN Space claim complete! $COL_RESET"
}

vpsbackup() {
  # Define variables in .vpsbackuprc file:
  #   mountpoint - path at which backup drive is mounted, e.g. /Volumes/MyBackup
  #   vpspath - path on server which to back up, e.g. server.com:/var/www/
  #   mountpath - path of the backup on the backup drive mounted, e.g. /Volumes/Backup/var/www/

  # Read configuration
  source ~/.vpsbackuprc

  # Mount backup drive
  mkdir -p $mountpoint
  mount_afp -i afp:/// $mountpoint

  # Start rsync
  caffeinate -i rsync -avz --progress --exclude-from '.vpsbackupignore' $vpspath $mountpath
}

alias cpuload=cpuload
alias stopload="killall yes"
alias dupelines=dupelines
alias uniquelines=uniquelines
alias xdiff=xdiff
alias claimspace=claimspace
alias vpsbackup=vpsbackup
alias fproc="ps aux | grep $1"

# Composer globals, e.g. Drush
export PATH="$HOME/.composer/vendor/bin:$PATH"

# MacPorts
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

# Docker
export DOCKER_TLS_VERIFY=1
export DOCKER_HOST=tcp://$(boot2docker ip 2>/dev/null):2376
export DOCKER_CERT_PATH=~/.boot2docker/certs/boot2docker-vm

dockerexec() {
  id=`docker ps -aq | head -n 1`
  echo -e "$COL_BLUE Accessing most recent container $id $COL_RESET"
  docker exec -it $id bash -l
}

tnotify() {
  terminal-notifier -message "$1" -title "$2" -activate com.apple.Terminal
}

alias dockerbuild="caffeinate docker-compose build && tnotify 'Docker build finished!' 'Docker'"
alias dockerup="caffeinate docker-compose up && tnotify 'Docker stopped!' 'Docker'"
alias dockerexec=dockerexec
alias dockerstop="docker-compose stop && tnotify 'Docker stopped!' 'Docker'"
alias dockerps="docker ps -a"

# NVM
[[ -s $HOME/.nvm/nvm.sh ]] && source "$HOME/.nvm/nvm.sh"
nvm use 0.12

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
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

# MySQL
MYSQL_HOME=/usr/local/mysql
alias mysqlstart="sudo $MYSQL_HOME/bin/mysqld_safe &"
alias mysqlstop="sudo $MYSQL_HOME/bin/mysqladmin shutdown"
alias mysqll="mysql --auto-rehash -u root -p"

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

PATH=$PATH:$HOME/.drush # Add Drush to PATH for Drupal automation

# MySQL
PATH=/usr/local/mysql/bin:$PATH

export PATH=/opt/local/bin:/opt/local/sbin:$PATH

[[ -s $HOME/.nvm/nvm.sh ]] && source "$HOME/.nvm/nvm.sh" # This loads NVM
nvm use 0.10 # loads latest Node 0.10.x

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# ImageMagick configuration (Binary distributed into /opt/local)
#export MAGICK_HOME=/opt/local
#export DYLD_LIBRARY_PATH=/opt/local/lib/
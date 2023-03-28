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

# MacPorts Installer addition on 2022-11-11_at_16:10:34: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

eval "$(rbenv init - zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.bash.inc" ]; then . "$HOME/google-cloud-sdk/path.bash.inc"; fi

# MacPorts Installer addition on 2020-12-02_at_01:05:43: adding an appropriate DISPLAY variable for use with MacPorts.
export DISPLAY=:0

# Rust
[[ -s "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

# Go
export PATH="$HOME/go/bin:$PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/opt/local/lib/google-cloud-sdk/path.zsh.inc' ]; then . '/opt/local/lib/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/opt/local/lib/google-cloud-sdk/completion.zsh.inc' ]; then . '/opt/local/lib/google-cloud-sdk/completion.zsh.inc'; fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

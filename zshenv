# use sublime as the visual editor
export VISUAL="subl -w"
export EDITOR=$VISUAL

# ensure dotfiles bin directory is loaded first
export PATH="$HOME/.bin:/usr/local/sbin:$PATH"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# Local config
[[ -f ~/.zshenv.local ]] && source ~/.zshenv.local

[ -n "$PS1" ] && source ~/.bash_profile

# Local config
[[ -f ~/.bashrc.local ]] && source ~/.bashrc.local

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

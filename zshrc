setopt promptsubst
export PS1='${SSH_CONNECTION+"%{$fg_bold[green]%}%n@%m:"}%{$fg_bold[blue]%}%c%{$reset_color%}$(git-radar --zsh) %# '

# add custom completion scripts
fpath=(~/.zsh/completion /usr/local/share/zsh/site-functions $fpath)

# compsys initialization
autoload -U compinit
compinit

# enable colored output from ls, etc
export CLICOLOR=1

# load custom executable functions
for function in ~/.zsh/functions/*; do
  source $function
done

# makes color constants available
autoload -U colors && colors

# enable colored output from ls, etc
export CLICOLOR=1

# history settings
setopt hist_ignore_all_dups inc_append_history
HISTFILE=~/.zhistory
HISTSIZE=4096
SAVEHIST=4096

# type the name of a directory, and it will become the current directory
setopt autocd

# if the argument to cd is the name of a parameter whose value is a valid
# directory, it will become the current directory.
setopt cdablevars

# Enable extended globbing
setopt extendedglob

# Allow [ or ] wherever you want
unsetopt nomatch

# # vi mode
# bindkey -v
# bindkey "^F" vi-cmd-mode
# bindkey jj vi-cmd-mode

# handy keybindings
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^K" kill-line
bindkey "^R" history-incremental-search-backward
bindkey "^P" history-search-backward
bindkey "^Y" accept-and-hold
bindkey "^N" insert-last-word
bindkey -s "^T" "^[Isudo ^[A" # "t" for "toughguy"

bindkey "^U" backward-kill-line
bindkey "^X\\x7f" backward-kill-line
bindkey "^X^_" redo

autoload -U select-word-style
select-word-style bash

# bindkey "^[[1;3C" forward-word
# bindkey "^[[1;3D" backward-word

# [direnv](http://direnv.net/)
eval "$(direnv hook zsh)"

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# exports
[[ -f ~/.exports ]] && source ~/.exports

# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

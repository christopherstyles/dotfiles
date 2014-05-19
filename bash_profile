# Load ~/.bash_prompt, ~/.exports, ~/.aliases and ~/.functions
# ~/.extra can be used for settings you don’t want to commit
for file in ~/.{extra,bash_prompt,exports,aliases,functions}; do
    [ -r "$file" ] && source "$file"
done
unset file

# init z    https://github.com/rupa/z
# . `brew --prefix`/etc/profile.d/z.sh

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults

# Git bash completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# https://github.com/zimbatm/direnv
eval "$(direnv hook bash)"

# https://github.com/github/hub
# eval "$(hub alias -s)"

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
# [ -z "$PS1" ] && return

# # don't put duplicate lines in the history. See bash(1) for more options
# # don't overwrite GNU Midnight Commander's setting of `ignorespace'.
# export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# # ... or force ignoredups and ignorespace
# export HISTCONTROL=ignoreboth

# # make less more friendly for non-text input files, see lesspipe(1)
# [ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
#
# # set variable identifying the chroot you work in (used in the prompt below)
# if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
#     debian_chroot=$(cat /etc/debian_chroot)
# fi

# # set a fancy prompt (non-color, unless we know we "want" color)
# case "$TERM" in
#     xterm-color) color_prompt=yes;;
# esac
#
# # uncomment for a colored prompt, if the terminal has the capability; turned
# # off by default to not distract the user: the focus in a terminal window
# # should be on the output of commands, not on the prompt
# #force_color_prompt=yes
#
# if [ -n "$force_color_prompt" ]; then
#     if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
# 	# We have color support; assume it's compliant with Ecma-48
# 	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
# 	# a case would tend to support setf rather than setaf.)
# 	color_prompt=yes
#     else
# 	color_prompt=
#     fi
# fi
#
# if [ "$color_prompt" = yes ]; then
#     # PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#     # export PS1='\[\033[01;34m\]\u:\[\033[01;32m\]\w\[\033[00;34m\]\[\033[01;32m\]\[\033[00m\]\[\033[01;33m\]$(__git_ps1)$ \[\033[00;37m\]'
#     # export PS1='\[\033[00;34m\]\u:\[\033[00;37m\]\w\[\033[00;34m\]\[\033[00;32m\]\[\033[00m\]\[\033[00;35m\]$(__git_ps1) \[\033[00;37m\]'
#     # export PS1='\[\033[\033[00;34m\]\w\[\033[00;34m\]\[\033[00;32m\]\[\033[00m\]\[\033[00;35m\]$(__git_ps1) \[\033[00;37m\]'
#     # export PS1='\e[0:35m⌘\e[m \e[0:36m\w/\e[m \e[0:33m`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /`\e[m'
#     export PS1='\e[0:34m\w/\e[m \e[0:35m`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /`\e[m'
# else
#     PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
# fi
# unset color_prompt force_color_prompt
#
# # If this is an xterm set the title to user@host:dir
# case "$TERM" in
# xterm*|rxvt*)
#     PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#     ;;
# *)
#     ;;
# esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
#
# if [ -f ~/.bash_aliases ]; then
# 	. ~/.bash_aliases
# fi

# # enable color support of ls and also add handy aliases
# if [ -x /usr/bin/dircolors ]; then
#     eval "`dircolors -b`"
#     alias ls='ls --color=auto'
#     #alias dir='dir --color=auto'
#     #alias vdir='vdir --color=auto'
#
#     #alias grep='grep --color=auto --line-number'
#     #alias fgrep='fgrep --color=auto'
#     #alias egrep='egrep --color=auto'
# fi

# # enable programmable completion features (you don't need to enable
# # this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# # sources /etc/bash.bashrc).
# if [ -f $(brew --prefix)/etc/bash_completion ]; then
# . $(brew --prefix)/etc/bash_completion
# fi

# MacPorts Installer addition on 2010-09-10_at_21:29:43: adding an appropriate PATH variable for use with MacPorts.
# export PATH=/usr/local/bin:/opt/local/bin:/opt/local/sbin:$HOME/bin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.
#

#export PATH=/opt/local/lib/postgresql84/bin:/opt/local/lib/postgresql83/bin:/usr/local/mysql/bin:/opt/local/apache2/bin:$PATH
# export PATH=/usr/local/mysql/bin:$PATH

# export LS_OPTIONS='--color=auto'
# export CLICOLOR='Yes'
# export LSCOLORS='ExFxCxDxBxxxexabagacAE'
# # export CC=gcc
# # export EDITOR=mate
# export EDITOR='sublime -w'

# MacPorts Installer addition on 2010-09-12_at_13:53:04: adding an appropriate PATH variable for use with MacPorts.
# export PATH=/opt/local/bin:/opt/local/sbin:/opt/local/lib/postgresql83/bin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

# export PYTHONPATH=/Library/Frameworks/Python.framework/Versions/Current/lib/python2.6/

# export PATH=${PATH}:~/bin

# export PATH=${PATH}:/Developer/usr/bin:/usr/bin:~/bin

# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init -)"

# # Brew
# export PATH="/usr/local/sbin:/usr/local/bin:./bin:$PATH"

# # Node
# export PATH="/usr/local/share/npm/bin:$PATH"

## Pick up NPM binaries
# export PATH="/usr/local/share/npm/bin:$PATH"

## Amazon AWS
# export JAVA_HOME="$(/usr/libexec/java_home)"
# export AWS_IAM_HOME="/usr/local/opt/aws-iam-tools/jars"
# export AWS_CREDENTIAL_FILE=$HOME/.aws-credentials-master

# if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# export EDITOR='subl -w'

# PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"

# export DYLD_LIBRARY_PATH=/Applications/Postgres.app/Contents/MacOS/lib:$DYLD_LIBRARY_PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias la='ls -la'
alias ll='ls -lrt'
alias ltr='ls -ltr'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias nosvngrep='grep --exclude='*.svn*''
alias vi='vim'

# Show git branch in the prompt
source ~/.git-prompt.sh

# Customise the prompt
PS1='\[\e[1;31m\]\u\[\e[0m\]\[\e[1;31m\]@\[\e[0m\]\[\e[1;31m\]\H\[\e[0m\] \W\[\e[0;33m\]$(__git_ps1 " (%s)")\[\e[0m\] $ '

stty -ixon

export PATH="/usr/local/bin:${PATH}"

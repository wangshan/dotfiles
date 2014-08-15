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
PS1='[\u@\h \W]\$ '

export PATH='/usr/local/bin:${PATH}'

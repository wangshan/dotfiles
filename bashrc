#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias la='ls -la'
alias ll='ls -lrt'
alias ltr='ls -ltr'
alias lta='ls -ltra'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias nosvngrep='grep --exclude='*.svn*''
alias vi='vim'

# Show git branch in the prompt
source ~/.git-prompt.sh

#0: Normal text
#1: Bold or light, depending on terminal
#4: Underline text
BLACK="\[\e[1;30m\]"
RED="\[\e[1;31m\]"
RED_WITH_BLACK_BACKGROUND="\[\e[40m\]\[\e[1;31m\]"
RED_WITH_WHITE_BACKGROUND="\[\e[47m\]\[\e[1;31m\]"
GREEN="\[\e[1;32m\]"
YELLOW="\[\e[1;33m\]"
BLUE="\[\e[1;34m\]"
PURPLE="\[\e[1;35m\]"
CYAN="\[\e[1;36m\]"
CYAN_NORMAL="\[\e[0;36m\]"
WHITE="\[\e[1;37m\]"
CLEAR="\[\e[0m\]"

# Customise the prompt
PS1="${RED}\u${CLEAR}${RED}@${CLEAR}${RED}\H${CLEAR} \W${YELLOW}\$(__git_ps1 ' (%s)')${CLEAR} $ "

# Use column to view a , separated csv file
csview()
{
    local file="$1"
    cat "$file" | sed -e 's/,,/, ,/g' | column -s, -t | less -#5 -N -S -X
}

# Stop ctrl + s from freezing tmux
stty -ixon

export PATH="/usr/local/bin:${PATH}"

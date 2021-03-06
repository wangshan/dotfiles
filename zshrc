# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="alanpeabody"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
# Have add this for brew command to work, see here for details:
# http://apple.stackexchange.com/questions/116459/upgrade-rvm-and-now-path-is-broken
if [ -x /usr/libexec/path_helper ]; then
    eval `/usr/libexec/path_helper -s`
fi

unsetopt correct_all
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# Use Vim from MacVim, in order to use YouCompleteMe, see this question:
# http://superuser.com/questions/334252/the-best-way-to-make-macvims-vim-console-not-mvim-the-default-instead-of-mac
alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
alias vi="/Applications/MacVim.app/Contents/MacOS/Vim"
alias lrt="ls -lrt"

# docker
# Need to do this every time a docker daemon is restarted
eval $(docker-machine env default)

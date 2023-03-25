export PATH=$PATH:~/.local/bin/

# dotfiles bare repo (use instead of 'git' for source control)
alias config='/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME'

alias la='ls -A'
alias ..='cd ..'
alias mv='mv -i'
alias rm='rm -i'

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
[ -r $HOME/.byobu/prompt ] && . $HOME/.byobu/prompt   #byobu-prompt#

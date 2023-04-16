export PATH=$PATH:~/.local/bin/

alias config='/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME'

alias la='ls -A'
alias ll='ls -lA'
alias ..='cd ..'
alias mv='mv -i'
alias rm='rm -i'
alias listwifi='nmcli d wifi list'
alias connectwifi='nmcli --ask d wifi connect'
alias matrix='unimatrix -lnnsss -s95'
alias clipboard='wl-copy'

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

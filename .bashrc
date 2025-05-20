# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Prompt
eval "$(starship init bash)"

# Path
export PATH=$PATH:~/.local/bin/

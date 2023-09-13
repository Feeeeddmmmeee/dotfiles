# Plugins
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-syntax-highlighting"

# Prompt
PROMPT="%{$fg[white]%}[%n@%m] %(?:%{$fg_bold[green]%} :%{$fg[red]%} )%(?:%{$fg[cyan]%}%1c :%{$fg[red]%}%1c )%{$reset_color%}"
# PROMPT="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )%{$fg[cyan]%}%~%{$reset_color%} "
# PROMPT="%(?:%{$fg_bold[green]%} :%{$fg_bold[red]%} )%{$fg[cyan]%}%~%{$reset_color%} "

# Exports
export PATH=$PATH:~/.local/bin/

# Aliases
alias config='/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME'

please() {
	sudo $(fc -ln -1)
}

alias :q='exit'
alias la='ls -A'
alias ll='ls -lA'
alias ..='cd ..'
alias mv='mv -i'
alias rm='rm -i'
alias listwifi='nmcli d wifi list'
alias connectwifi='nmcli --ask d wifi connect'
alias matrix='unimatrix -lnnsss -s95'
alias clipboard='wl-copy'
alias icat='kitty +kitten icat'
alias pls='please'
alias kot='cat'
alias weather='curl wttr.in'
alias sdn='shutdown now'

alias token='cat ~/.token | clipboard'
alias logout='pkill -KILL -u $(whoami)'

alias ls='ls --color=auto'
alias grep='grep --color=auto'

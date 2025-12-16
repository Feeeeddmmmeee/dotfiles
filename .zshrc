# Prompt
eval "$(starship init zsh)"
eval "$(atuin init zsh)"

# Repeat last command with sudo
pls() {
	sudo $(fc -ln -1)
}

# Path
export PATH=$PATH:~/.local/bin/
export EDITOR=nvim

gpush() {
	local branch
	branch="$(git rev-parse --abbrev-ref HEAD)"
	git push origin "$branch"
}

gpull() {
	local branch
	branch="$(git rev-parse --abbrev-ref HEAD)"
	git pull origin "$branch"
}

# Aliases
alias gs="git status"
alias ga="git add"
alias gl="git log"
alias gc="git commit -m"
alias gch="git checkout"

alias la="ls -A"
alias ll="ls -lA"
alias ..="cd .."
alias :q="exit"
alias :wq="exit"
alias sdn="shutdown now"
alias nv="nvim"
alias icat="kitty +kitten icat"

alias gitfetch="onefetch --include-hidden"
alias neofetch="fastfetch"
alias matrix="unimatrix -af -l m -s 95"

alias rm="rm -i"
alias mv="mv -i"

alias ls="ls --color=auto"
alias grep="grep --color=auto"

# Pywal
(cat ~/.cache/wal/sequences &)

# For tty
# source ~/.cache/wal/colors-tty.sh

# Zoxide
eval "$(zoxide init zsh --cmd cd)"

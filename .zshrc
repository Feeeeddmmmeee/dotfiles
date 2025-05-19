# Prompt
eval "$(starship init zsh)"

# Repeat last command with sudo
pls() {
	sudo $(fc -ln -1)
}

# Aliases
alias gs="git status"
alias ga="git add"
alias gc="git commit -m"

alias la="ls -A"
alias ll="ls -lA"
alias ..="cd .."
alias sdn="shutdown now"
alias icat="kitty +kitten icat"

alias onefetch="onefetch --include-hidden"
alias neofetch="fastfetch"

alias rm="rm -i"
alias mv="mv -i"

alias ls="ls --color=auto"
alias grep="grep --color=auto"

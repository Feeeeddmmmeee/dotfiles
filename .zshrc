# Prompt
eval "$(starship init zsh)"
eval "$(atuin init zsh)"

# Repeat last command with sudo
pls() {
	sudo $(fc -ln -1)
}

# Adds and then commits the selected files
git-add-commit()
{
	if [ "$#" -lt 2 ]; then
		echo "Invalid usage! $0 file1 [file2 ... fileN] commitMsg"
		return 1
	fi

	commitMsg="${@: -1}"
	files=("${@[1,-2]}")
	git add $files
	git commit -m $commitMsg
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
alias gac="git-add-commit"

alias la="ls -A"
alias ll="ls -lA"
alias ..="cd .."
alias :q="exit"
alias :wq="exit"
alias sdn="shutdown now"
alias rbl="sudo efibootmgr --bootnext 0004; reboot"
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

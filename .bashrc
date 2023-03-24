#
# ~/.bashrc
#

# toggles the wifi
wifi-toggle()
{
	WIFI="$(nmcli r wifi | awk 'FNR = 2 {print $1}')"
	if [ "$WIFI" == "enabled" ]
	then 
		nmcli r wifi off
	else
		nmcli r wifi on
	fi
}

# dotfiles bare repo (use instead of 'git' for source control)
alias config='/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME'

alias la='ls -A'
alias ..='cd ..'
alias mv='mv -i'
alias rm='rm -i'

# simplified c compilation script
# $1 - the file to compile
# $2 - name of the output file. defaults to the cpp file with its extension removed
c()
{
	OUTPUT=${2:-${1%.cpp}}
	g++ -o $OUTPUT $1 && ./$OUTPUT
}

# copies a template c++ file and opens it in nvim
cnvim()
{
	FILE_PATH=${1:-main.cpp}
	cat "${HOME}/.config/nvim/templates/cpp_bits.cpp" > $FILE_PATH

	nvim -c 'startinsert' +10 $FILE_PATH
}

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
[ -r $HOME/.byobu/prompt ] && . $HOME/.byobu/prompt   #byobu-prompt#

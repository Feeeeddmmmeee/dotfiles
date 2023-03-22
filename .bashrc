#
# ~/.bashrc
#

wifi()
{
	WIFI="$(nmcli r wifi | awk 'FNR = 2 {print $1}')"
	if [ "$WIFI" == "enabled" ]
	then 
		nmcli r wifi off
	else
		nmcli r wifi on
	fi
}

# dotfiles repo
alias config='/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME'

alias la='ls -A'
alias ..='cd ..'
alias mv='mv -i'
alias rv='rm -i'

# simplified c compilation script
# $1 - the file to compile
# $2 - name of the output file. defaults to the cpp file with its extension removed
c()
{
	OUTPUT=${2:-${1%.cpp}}
	g++ -o $OUTPUT $1 && ./$OUTPUT
}

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
[ -r /home/janek/.byobu/prompt ] && . /home/janek/.byobu/prompt   #byobu-prompt#

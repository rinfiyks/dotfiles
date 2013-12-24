# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=""
HISTFILESIZE=""
# Make sure terminal wraps lines correctly after resize
shopt -s checkwinsize

if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	color_prompt=yes
else
	color_prompt=
fi

function setColorPrompt() { 
	local NONE="\[\033[0m\]"
	local BLACK="\[\033[0;30m\]"
	local BLACKB="\[\033[1;30m\]"
	local RED="\[\033[0;31m\]"
	local REDB="\[\033[1;31m\]"
	local GREEN="\[\033[0;32m\]"
	local GREENB="\[\033[1;32m\]"
	local YELLOW="\[\033[0;33m\]"
	local YELLOWB="\[\033[1;33m\]"
	local BLUE="\[\033[0;34m\]"
	local BLUEB="\[\033[1;34m\]"
	local PURPLE="\[\033[0;35m\]"
	local PURPLEB="\[\033[1;35m\]"
	local CYAN="\[\033[0;36m\]"
	local CYANB="\[\033[1;36m\]"
	local WHITE="\[\033[0;37m\]"
	local WHITEB="\[\033[1;37m\]"

	if [ $EUID == 0 ]; then
		local NHCOLOR="$REDB";
	else
		local NHCOLOR="$GREENB";
	fi

	PS1="${NHCOLOR}\u${BLUEB}@${NHCOLOR}\h${NONE}:${BLUEB}\w${NONE}\$([[ \$? != 0 ]] && echo \"${RED}\")\$${NONE} "
}
if [ "$color_prompt" = yes ]; then
	setColorPrompt;
else
	PS1="\u@\h:\w$ "
fi
unset color_prompt

if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

if [ -f /usr/share/doc/pkgfile/command-not-found.bash ]; then
	. /usr/share/doc/pkgfile/command-not-found.bash
fi

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

if ! shopt -oq posix; then
	if [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	elif [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	fi
fi
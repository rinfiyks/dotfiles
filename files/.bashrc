# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# ignore duplicate consecutive commands and ignore commands that start with whitespace
HISTCONTROL=ignoreboth

# append rather than overwrite history file
shopt -s histappend

# append immediately to history file (use `history -n` to read the updates into an existing session)
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

# infinite history size
HISTSIZE=""
HISTFILESIZE=""
# Make sure terminal wraps lines correctly after resize
shopt -s checkwinsize

# So that you can do C-s for i-search
stty -ixon

if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null && false; then
  NONE="\[\033[0m\]"
  BLACK="\[\033[0;30m\]"
  BLACKB="\[\033[1;30m\]"
  RED="\[\033[0;31m\]"
  REDB="\[\033[1;31m\]"
  GREEN="\[\033[0;32m\]"
  GREENB="\[\033[1;32m\]"
  YELLOW="\[\033[0;33m\]"
  YELLOWB="\[\033[1;33m\]"
  BLUE="\[\033[0;34m\]"
  BLUEB="\[\033[1;34m\]"
  PURPLE="\[\033[0;35m\]"
  PURPLEB="\[\033[1;35m\]"
  CYAN="\[\033[0;36m\]"
  CYANB="\[\033[1;36m\]"
  WHITE="\[\033[0;37m\]"
  WHITEB="\[\033[1;37m\]"

  if [ $EUID == 0 ]; then
    NHCOLOR="$REDB";
  else
    NHCOLOR="$GREENB";
  fi
fi

if [ -e /usr/share/git/completion/git-prompt.sh ]; then
  . /usr/share/git/completion/git-prompt.sh
  GIT_PS1="${YELLOW}\$(__git_ps1)"
fi

PS1="${NHCOLOR}\u${NONE}@${NHCOLOR}\h${NONE}:${NHCOLOR}\w${GIT_PS1}${NONE}\$([[ \$? -ne 0 ]] && echo \"${RED}\")\\$""${NONE} "

if [ -x /usr/bin/dircolors ]; then
  test -r $HOME/.dircolors && eval "$(dircolors -b $HOME/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

if [ -f /usr/share/doc/pkgfile/command-not-found.bash ]; then
  . /usr/share/doc/pkgfile/command-not-found.bash
fi

if [ -f $HOME/.bash_aliases ]; then
  . $HOME/.bash_aliases
fi

if [ -f $HOME/.bash_aliases_local ]; then
  . $HOME/.bash_aliases_local
fi

if ! shopt -oq posix; then
  if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  elif [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  fi
fi

export VISUAL=vim
export EDITOR="$VISUAL"

if [ -f $HOME/.bashrc_local ]; then
  . $HOME/.bashrc_local
fi

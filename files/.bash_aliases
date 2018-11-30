alias apt5='sudo apt-get check && sudo apt-get update && sudo apt-get dist-upgrade && sudo apt-get autoremove --purge && sudo apt-get autoclean'

alias bleep='paplay /usr/share/sounds/freedesktop/stereo/complete.oga'

alias ifc='ifconfig'

alias ixio='curl -F "'"f:1=<-"'" ix.io'

alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'

alias p8='ping 8.8.8.8'

alias rfind='find -regextype posix-extended -regex'

alias speedtest='wget --output-document=/dev/null http://speedtest.wdc01.softlayer.com/downloads/test500.zip'

alias syu='yay -Syu'

alias tmux='tmux -2'

alias gitclone='gitclone'
function gitclone {
  git clone git@github.com:rinfiyks/$@.git
}

alias s='git status'
alias d='git diff'

alias curl='curl -w "\n"'
alias tw='p=${PWD//*\//} && tmux rename-window "${p:-/}"'

alias rfind='find -regextype posix-extended -regex'
alias bleep='paplay /usr/share/sounds/freedesktop/stereo/complete.oga'
alias j='$HOME/j64-701/bin/jconsole | sed "'"s/^   //"'"'
alias speedtest='wget --output-document=/dev/null http://speedtest.wdc01.softlayer.com/downloads/test500.zip'
alias talk='talk'
function talk {
echo "$@" | text2wave | aplay
}

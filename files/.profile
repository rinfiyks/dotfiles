if [ -d "$HOME/bin" ]; then
    PATH="$PATH:$HOME/bin"
fi

if [ -f "$HOME/.profile_local" ]; then
    . "$HOME/.profile_local"
fi

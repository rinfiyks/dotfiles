if [ -d "$HOME/bin" ]; then
  PATH="$PATH:$HOME/bin"
fi

if [ -d "$HOME/.cabal/bin" ]; then
  PATH="$PATH:$HOME/.cabal/bin"
fi

if [ -f "$HOME/.profile_local" ]; then
  . "$HOME/.profile_local"
fi

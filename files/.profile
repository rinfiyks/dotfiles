if [ -d "$HOME/bin" ]; then
  PATH="$PATH:$HOME/bin"
fi

if [ -d "$HOME/.cabal/bin" ]; then
  PATH="$PATH:$HOME/.cabal/bin"
fi

if [ -d "$HOME/.npm-global/bin" ]; then
  PATH="$PATH:$HOME/.npm-global/bin"
fi

if [ -f "$HOME/.profile_local" ]; then
  . "$HOME/.profile_local"
fi

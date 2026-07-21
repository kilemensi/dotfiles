# Safely parse POSIX profile
if [ -f ~/.profile ]; then
  emulate sh -c 'source ~/.profile'
fi

# Safely activate mise shims if/when available
if type mise &> /dev/null; then
  eval "$(mise activate zsh --shims)"
fi

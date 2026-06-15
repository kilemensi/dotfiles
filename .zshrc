# Configure brew completions
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

# Configure editor for remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
fi

# Configure aliases
if [ -f "$HOME/.aliases" ]; then
	source "$HOME/.aliases"
fi

# Begin custom installations

# Configure telemetry e.g. claude, gh, etc.
export {DISABLE_TELEMETRY,DO_NOT_TRACK}=1

# Configure mise: make mise-managed tools available first
if type mise &> /dev/null; then
    eval "$(mise activate zsh)"
fi

# Configure editor for local sessions
if type nvim &> /dev/null; then
  export EDITOR="nvim"
  export VISUAL="nvim"
fi

# Configure fzf: key bindings and completion
if type fzf &> /dev/null; then
    source <(fzf --zsh)
fi

# Configure zoxide: smarter cd command
if type zoxide &> /dev/null; then
    eval "$(zoxide init zsh)"
fi

# Configure starship: prompt should usually be last
if type starship &> /dev/null; then
    export STARSHIP_CONFIG=~/.config/starship/starship.toml
    eval "$(starship init zsh)"
fi

# End custom installations

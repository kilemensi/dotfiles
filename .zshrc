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

# Configure telemetry e.g. claude
export DISABLE_TELEMETRY=1

# Configure cargo
if [ -f "$HOME/.cargo/env" ]; then
  source "$HOME/.cargo/env"
fi

# Configure fzf
if type fzf &> /dev/null; then
    source <(fzf --zsh)
fi

# Configure zoxide
if type zoxide &> /dev/null; then
    eval "$(zoxide init zsh)"
fi

# Configure mise
if type mise &> /dev/null; then
    eval "$(mise activate zsh)"
fi

# Configure starship
if type starship &> /dev/null; then
    export STARSHIP_CONFIG=~/.config/starship/starship.toml
    eval "$(starship init zsh)"
fi

# End custom installations

# Configure brew
export HOMEBREW_NO_ANALYTICS=1
eval "$(/opt/homebrew/bin/brew shellenv)"

# Configure brew completions
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

# Configure editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Configure aliases
if [ -f $HOME/.aliases ]; then
	source $HOME/.aliases
fi

# Begin manual installations

# Configure $HOME/.local/bin (add it to PATH if it exists)
if [ -d "$HOME/.local/bin" ]; then
  export PATH="$HOME/.local/bin:$PATH"
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

# End manual installations

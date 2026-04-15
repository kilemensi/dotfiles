# Configure brew
export HOMEBREW_NO_ANALYTICS=1
eval "$(/opt/homebrew/bin/brew shellenv)"

# Configure PATH
if [ -f "$HOME/.local/bin/env" ]; then
  source "$HOME/.local/bin/env"
fi

# Configure editor for local sessions
export EDITOR='nvim'

# Load machine-specific secrets (NOT in Git)
if [ -f "$HOME/.profile.local" ]; then
  source "$HOME/.profile.local"
fi

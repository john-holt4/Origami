# --- Podman/Docker Aliases ---
alias docker='podman'
alias docker-compose='podman-compose'

alias cat='bat'

alias fastfetch='fastfetch -l /usr/share/fastfetch/presets/origami/origami-ascii.txt --logo-color-1 blue -c/usr/share/fastfetch/presets/origami/origami-fastfetch.jsonc'

# eza aliases
alias l='eza --icons'
alias ls='eza --icons'                 # A "safe" override for interactive use
alias ll='eza -l --icons'              # long list
alias la='eza -la --icons'             # long list, all files
alias l.='eza -la --ignore=.git --icons' # A good one for projects
alias lt='eza --tree --level=2 --icons'  # tree view

# --- Init functions ---

# Set up fzf key bindings and fuzzy completion if fzf exists
if command -v fzf &> /dev/null; then
  eval "$(fzf --bash)"
fi

# Set up zoxide if it exists
if command -v zoxide &> /dev/null; then
  eval "$(zoxide init bash)"
fi

# Set up starship prompt if it exists
if command -v starship &> /dev/null; then
  # Ensure starship init runs only in interactive shells
  case "$-" in
      *i*) eval "$(starship init bash)" ;;
      *) ;;
  esac
fi

# --- Nag functions (Optional) ---

# Nag user to use 'fd' instead of 'find' if fd exists
if command -v fd &> /dev/null; then
  find() {
    echo "\U0001f4a1 Tip: Try using 'fd' next time for a simpler and faster search." >&2
    command find "$@"
  }
fi

# Nag user to use 'rg' instead of 'grep' if rg exists
if command -v rg &> /dev/null; then
  grep() {
    if [[ -t 2 ]]; then
      echo "\U0001f4a1 Tip: Try using 'rg' for a simpler and faster search." >&2
    fi
    command grep "$@"
  }
fi
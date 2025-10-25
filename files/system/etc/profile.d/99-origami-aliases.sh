#!/bin/bash

# This file is automatically loaded by your shell
unalias ls > /dev/null 2>&1 || true # Ignore errors if alias doesn't exist
unalias ll > /dev/null 2>&1 || true # Ignore errors if alias doesn't exist
unalias l. > /dev/null 2>&1 || true # Ignore errors if alias doesn't exist

# --- Podman/Docker Aliases ---
alias docker='podman'
alias docker-compose='podman-compose'

alias cat='bat'

# eza aliases
alias l='eza --icons'
alias ls='eza --icons'                 # A "safe" override for interactive use
alias ll='eza -l --icons'              # long list
alias la='eza -la --icons'             # long list, all files
alias l.='eza -la --ignore=.git --icons' # A good one for projects
alias lt='eza --tree --level=2 --icons'  # tree view

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"

eval "$(zoxide init bash)"

eval "$(starship init bash)"

#
# Nag user to use 'fd' instead of 'find'
#
find() {
  # This prints the message to your terminal's error output (stderr)
  # so it doesn't interfere with the command's real output.
  echo "💡 Tip: Try using 'fd' next time for a simpler and faster search." >&2

  # This executes the *real* find command with all your original arguments
  command find "$@"
}

#
# Nag user to use 'rg' instead of 'grep'
#
grep() {
  # This checks if stderr is an interactive terminal
  # so the message won't show up in scripts.
  if [[ -t 2 ]]; then
    echo "💡 Tip: Try using 'rg' for a simpler and faster search." >&2
  fi

  # Execute the real grep command
  command grep "$@"
}
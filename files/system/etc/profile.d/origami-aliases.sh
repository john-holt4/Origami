#!/usr/bin/env bash

# Skip aliases and overrides when inside Distrobox
if [ -n "$DISTROBOX_ENTER_PATH" ]; then
    return
fi

# --- eza Aliases (no conflicts) ---
# These are fine as simple aliases.
alias la='eza -la --icons'
alias lt='eza --tree --level=2 --icons'

# --- eza Functions (to override colorls.sh) ---
# We must unalias them first to avoid a parsing syntax error
unalias ls 2>/dev/null
ls() {
    command eza --icons "$@"
}

unalias ll 2>/dev/null
ll() {
    # This specifically overrides 'ls -l --color=auto'
    command eza -l --icons "$@"
}

# --- Podman/Docker Aliases ---
alias docker='podman'
alias docker-compose='podman-compose'

alias cat='bat'

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"

eval "$(zoxide init bash)"

eval "$(starship init bash)"

# --- Nag user to use 'fd' instead of 'find' ---
function find {
    printf '💡 Tip: Try using "fd" next time for a simpler and faster search.\n' >&2
    command find "$@"
}

# --- Nag user to use 'rg' instead of 'grep' ---
function grep {
    if [ -t 2 ]; then
        printf '💡 Tip: Try using "rg" for a simpler and faster search.\n' >&2
    fi
    command grep "$@"
}
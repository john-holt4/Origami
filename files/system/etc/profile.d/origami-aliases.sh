#!/usr/bin/env bash

# Skip aliases and overrides when inside Distrobox
if [ -n "$DISTROBOX_ENTER_PATH" ]; then
    return
fi

# --- eza functions (will override any alias) ---
l() {
    command eza --icons "$@"
}
ls() {
    command eza --icons "$@"
}
la() {
    command eza -la --icons "$@"
}
lt() {
    command eza --tree --level=2 --icons "$@"
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
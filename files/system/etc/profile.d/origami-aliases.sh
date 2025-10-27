# Skip aliases and overrides when inside Distrobox
if [ -n "$DISTROBOX_ENTER_PATH" ]; then
    return
fi

alias fastfetch='fastfetch -l /usr/share/fastfetch/presets/origami/origami-ascii.txt --logo-color-1 blue -c /usr/share/fastfetch/presets/origami/origami-fastfetch.jsonc'

# --- Podman/Docker Aliases ---
alias docker='podman'
alias docker-compose='podman-compose'

alias cat='bat'

# eza aliases
alias l='eza --icons'
alias ls='eza --icons'                 # A "safe" override for interactive use
alias la='eza -la --icons'             # long list, all files
alias lt='eza --tree --level=2 --icons'  # tree view

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
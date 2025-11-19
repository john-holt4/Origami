#!/usr/bin/env bash

# Skip aliases and overrides when inside Distrobox
if [ -n "$DISTROBOX_ENTER_PATH" ]; then
    return
fi

alias fastfetch='fastfetch -l /usr/share/fastfetch/presets/origami/origami-ascii.txt --logo-color-1 blue -c /usr/share/fastfetch/presets/origami/origami-fastfetch.jsonc'

# --- eza Aliases (no conflicts) ---
# These are fine as simple aliases.
alias la='eza -la --icons'
alias lt='eza --tree --level=2 --icons'

# This will run all three commands in sequence, stopping if any one of them fails.
alias update='topgrade'

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

alias sudo='sudo-rs'
alias su='su-rs'

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"

eval "$(starship init bash)"

eval "$(zoxide init bash --cmd cd)"

# === uutils-coreutils Aliases ===
# Dynamically alias all uu_* binaries found in /usr/bin/

for uu_bin in /usr/bin/uu_*; do
    # Check if the file exists to avoid errors if package is missing
    [ -e "$uu_bin" ] || continue

    # Extract the command name (remove path and 'uu_' prefix)
    base_cmd=$(basename "$uu_bin")
    std_cmd="${base_cmd#uu_}"

    # Skip commands that should not be aliased:
    # - ls, cat: Handled by eza/bat
    # - [, test: specific shell builtins that must NOT be aliased
    case "$std_cmd" in
        ls|cat|'['|test) continue ;;
    esac

    # Create the alias
    alias "$std_cmd"="$base_cmd"
done
# === End of uutils-coreutils Aliases ===


# --- Nag user to use 'fd' instead of 'find' ---
function find {
    if [ -t 2 ]; then
        printf 'Tip: Try using "fd" next time for a simpler and faster search.\n' >&2
    fi
    command find "$@"
}

# --- Nag user to use 'rg' instead of 'grep' ---
function grep {
    if [ -t 2 ]; then
        printf 'Tip: Try using "rg" for a simpler and faster search.\n' >&2
    fi
    command grep "$@"
}

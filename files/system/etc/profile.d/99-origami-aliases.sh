#!/bin/bash

# This file is automatically loaded by your shell

# --- Podman/Docker Aliases ---
alias docker='podman'
alias docker-compose='podman-compose'

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"
#!/bin/bash

# This file is automatically loaded by your shell

# --- Podman/Docker Aliases ---
alias docker='podman'
alias docker-compose='podman-compose'

# --- Enable FZF Keybindings & Completion ---
if [ -f "/usr/share/fzf/key-bindings.bash" ]; then
  source "/usr/share/fzf/key-bindings.bash"
fi
if [ -f "/usr/share/fzf/completion.bash" ]; then
  source "/usr/share/fzf/completion.bash"
fi

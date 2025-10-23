#!/bin/bash

# This file is automatically loaded by your shell

# --- Eza Aliases ---
alias ls='eza --icons --group-directories-first'
alias ll='eza -l --icons --git --group-directories-first'
alias l.='eza -la --icons --git --group-directories-first'
alias tree='eza --tree'

# --- Podman/Docker Aliases ---
alias docker='podman'
alias docker-compose='podman-compose'

# --- Enable Starship Prompt ---
if command -v starship &> /dev/null && [ -n "$PS1" ]; then
  eval "$(starship init bash)"
fi

# --- Enable FZF Keybindings & Completion ---
if [ -f "/usr/share/fzf/key-bindings.bash" ]; then
  source "/usr/share/fzf/key-bindings.bash"
fi
if [ -f "/usr/share/fzf/completion.bash" ]; then
  source "/usr/share/fzf/completion.bash"
fi

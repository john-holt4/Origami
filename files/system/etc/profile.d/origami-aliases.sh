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
# Using Rust-based coreutils.
# 'ls' and 'cat' are intentionally omitted
# to keep this file's 'eza' and 'bat' aliases.
#alias [='uu_['
alias b2sum='uu_b2sum'
alias b3sum='uu_b3sum'
alias base32='uu_base32'
alias base64='uu_base64'
alias basename='uu_basename'
alias basenc='uu_basenc'
alias chcon='uu_chcon'
alias cksum='uu_cksum'
alias comm='uu_comm'
alias cp='uu_cp'
alias csplit='uu_csplit'
alias cut='uu_cut'
alias date='uu_date'
alias dd='uu_dd'
alias df='uu_df'
alias dir='uu_dir --color=auto'
alias dircolors='uu_dircolors'
alias dirname='uu_dirname'
alias du='uu_du'
alias echo='uu_echo'
alias env='uu_env'
alias expand='uu_expand'
alias expr='uu_expr'
alias factor='uu_factor'
alias false='uu_false'
alias fmt='uu_fmt'
alias fold='uu_fold'
alias hashsum='uu_hashsum'
alias head='uu_head'
alias id='uu_id'
alias join='uu_join'
alias link='uu_link'
alias ln='uu_ln'
alias md5sum='uu_md5sum'
alias mkdir='uu_mkdir'
alias mktemp='uu_mktemp'
alias more='uu_more'
alias mv='uu_mv'
alias nl='uu_nl'
alias numfmt='uu_numfmt'
alias od='uu_od'
alias paste='uu_paste'
alias pr='uu_pr'
alias printenv='uu_printenv'
alias printf='uu_printf'
alias ptx='uu_ptx'
alias pwd='uu_pwd'
alias readlink='uu_readlink'
alias realpath='uu_realpath'
alias rm='uu_rm'
alias rmdir='uu_rmdir'
alias runcon='uu_runcon'
alias seq='uu_seq'
alias sha1sum='uu_sha1sum'
alias sha224sum='uu_sha224sum'
alias sha256sum='uu_sha256sum'
alias sha3-224sum='uu_sha3-224sum'
alias sha3-256sum='uu_sha3-256sum'
alias sha3-384sum='uu_sha3-384sum'
alias sha3-512sum='uu_sha3-512sum'
alias sha384sum='uu_sha384sum'
alias sha3sum='uu_sha3sum'
alias sha512sum='uu_sha512sum'
alias shake128sum='uu_shake128sum'
alias shake256sum='uu_shake256sum'
alias shred='uu_shred'
alias shuf='uu_shuf'
alias sleep='uu_sleep'
alias sort='uu_sort'
alias split='uu_split'
alias sum='uu_sum'
alias tac='uu_tac'
alias tail='uu_tail'
alias tee='uu_tee'
alias test='uu_test'
alias touch='uu_touch'
alias tr='uu_tr'
alias true='uu_true'
alias truncate='uu_truncate'
alias tsort='uu_tsort'
alias unexpand='uu_unexpand'
alias uniq='uu_uniq'
alias unlink='uu_unlink'
alias vdir='uu_vdir --color=auto'
alias wc='uu_wc'
alias yes='uu_yes'
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

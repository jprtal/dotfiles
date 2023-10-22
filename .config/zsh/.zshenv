# Set ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh" in /etc/zsh/zshenv

export CLICOLOR=1

export _CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export _STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"
export _DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export _CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"

# Dotfolders
export RUSTUP_HOME="$_DATA_HOME"/rustup
export CARGO_HOME="$_DATA_HOME/cargo"
export PNPM_HOME="$HOME/Library/pnpm"

unset _CONFIG_HOME
unset _STATE_HOME
unset _DATA_HOME
unset _CACHE_HOME

# Rootless Podman docker-compose support
if [[ -e "$HOME/.local/share/containers/podman/machine/qemu/podman.sock" ]]; then
    export DOCKER_HOST="unix://$HOME/.local/share/containers/podman/machine/qemu/podman.sock"
fi

typeset -U PATH path
path=("$PNPM_HOME" "$CARGO_HOME/bin" "${path[@]}")
export PATH

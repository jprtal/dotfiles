# Set ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh" in /etc/zsh/zshenv

export PAGER="${PAGER:-less}"
export LESS="${LESS:--R}"

export EDITOR="${EDITOR:-nano}"

export _CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export _STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"
export _DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export _CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"

# Dotfolders
export WGETRC="$_CONFIG_HOME/wgetrc"
# Doesn't really work because of systemd user units and socket-based activation
# export GNUPGHOME="$_CONFIG_HOME/gnupg"
# [[ ! -d ${GNUPGHOME} ]] && mkdir -m 700 "${GNUPGHOME}"
export GR_PREFS_PATH="$_CONFIG_HOME/gnuradio"
export GRC_PREFS_PATH="$_CONFIG_HOME/gnuradio/grc.conf"
export GTK2_RC_FILES="$_CONFIG_HOME/gtk-2.0/gtkrc"
export _JAVA_OPTIONS="-Djava.util.prefs.userRoot=$_CONFIG_HOME/java"
export DOCKER_CONFIG="$_CONFIG_HOME/docker"
export LESSHISTFILE="$_STATE_HOME/less/lesshst"
export PYTHONHISTFILE="$_STATE_HOME/python_history"
export RUSTUP_HOME="$_DATA_HOME"/rustup
export CARGO_HOME="$_DATA_HOME/cargo"
export NVM_DIR="$_DATA_HOME/nvm"
export NODE_REPL_HISTORY="$_DATA_HOME/node_repl_history"
export TS_NODE_HISTORY="$_DATA_HOME/ts_node_repl_history"
export PLATFORMIO_CORE_DIR="$_DATA_HOME/platformio"
export CUDA_CACHE_PATH="$_CACHE_HOME/nv"

unset _CONFIG_HOME
unset _STATE_HOME
unset _DATA_HOME
unset _CACHE_HOME

# Rootless Podman docker-compose support
if [[ -e "$XDG_RUNTIME_DIR/podman/podman.sock" ]]; then
    export DOCKER_HOST="unix://$XDG_RUNTIME_DIR/podman/podman.sock"
fi

export ANDROID_HOME="$HOME/Android/Sdk"
export CHROME_EXECUTABLE="/usr/bin/chromium"

# typeset -U PATH path
# path=("$CARGO_HOME/bin" "${path[@]}")
# export PATH

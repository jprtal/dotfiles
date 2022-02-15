# Set ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh" in /etc/zsh/zshenv

typeset -U PATH path
path=("$HOME/.local/bin" "$path[@]")
export PATH

export PAGER="${PAGER:-less}"
export LESS="${LESS:--R}"

# Dotfolders
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wgetrc"
# export GNUPGHOME="${XDG_CONFIG_HOME:-$HOME/.config}/gnupg"
export CARGO_HOME="${XDG_CONFIG_HOME:-$HOME/.config}/cargo"
export GTK2_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc"
export _JAVA_OPTIONS="-Djava.util.prefs.userRoot=${XDG_CONFIG_HOME:-$HOME/.config}/java"
# export GRADLE_USER_HOME="${XDG_CONFIG_HOME:-$HOME/.config}/gradle"
export LESSHISTFILE="${XDG_STATE_HOME:-$HOME/.local/state}/less/lesshst"
export PYTHONHISTFILE="${XDG_STATE_HOME:-$HOME/.local/state}/python_history"
# export VSCODE_EXTENSIONS="${XDG_DATA_HOME:-$HOME/.local/share}/vscode-oss/extensions"

export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"

export ANDROID_HOME="$HOME/Android/Sdk"
export CHROME_EXECUTABLE="/usr/bin/chromium"
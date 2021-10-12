# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


CUSTOM_ZSH_CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
if [[ -d "${CUSTOM_ZSH_CONFIG_DIR}" ]]; then
  [[ -d "${CUSTOM_ZSH_CONFIG_DIR}/aliases" ]] && source ${CUSTOM_ZSH_CONFIG_DIR}/aliases/*

  [[ -d "${CUSTOM_ZSH_CONFIG_DIR}/completions" ]] && fpath=( "${CUSTOM_ZSH_CONFIG_DIR}/completions" "${fpath[@]}" )

  if [[ -d "${CUSTOM_ZSH_CONFIG_DIR}/functions" ]]; then
    fpath=( "${CUSTOM_ZSH_CONFIG_DIR}/functions" "${fpath[@]}" )
    # Load functions
    autoload -Uz ${fpath[1]}/*(:t)
  fi
fi
unset CUSTOM_ZSH_CONFIG_DIR


export PATH="$HOME/.local/bin:$PATH"

export PAGER="${PAGER:-less}"
export LESS="${LESS:--R}"


HISTFILE=~/.histfile
HISTSIZE=50000
SAVEHIST=10000


# Keybindings
bindkey -e

# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"
key[Control-Left]="${terminfo[kLFT5]}"
key[Control-Right]="${terminfo[kRIT5]}"
key[Control-Delete]="${terminfo[kDC5]}"
key[Control-Backspace]="${terminfo[kbs]}"

# setup key accordingly
[[ -n "${key[Home]}" ]] && bindkey -- "${key[Home]}" beginning-of-line
[[ -n "${key[End]}" ]] && bindkey -- "${key[End]}" end-of-line
# [[ -n "${key[Insert]}" ]] && bindkey -- "${key[Insert]}" overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}" backward-delete-char
[[ -n "${key[Delete]}" ]] && bindkey -- "${key[Delete]}" delete-char
[[ -n "${key[Up]}" ]] && bindkey -- "${key[Up]}" up-line-or-history
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-history
[[ -n "${key[Left]}" ]] && bindkey -- "${key[Left]}" backward-char
[[ -n "${key[Right]}" ]] && bindkey -- "${key[Right]}" forward-char
# [[ -n "${key[PageUp]}" ]] && bindkey -- "${key[PageUp]}" beginning-of-buffer-or-history
# [[ -n "${key[PageDown]}" ]] && bindkey -- "${key[PageDown]}" end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}" reverse-menu-complete
[[ -n "${key[Control-Left]}" ]] && bindkey -- "${key[Control-Left]}" backward-word
[[ -n "${key[Control-Right]}" ]] && bindkey -- "${key[Control-Right]}" forward-word
[[ -n "${key[Control-Delete]}" ]] && bindkey -- "${key[Control-Delete]}" kill-word
[[ -n "${key[Control-Backspace]}" ]] && bindkey -- "${key[Control-Backspace]}" backward-kill-word

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
  autoload -Uz add-zle-hook-widget
  function zle_application_mode_start { echoti smkx }
  function zle_application_mode_stop { echoti rmkx }
  add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
  add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi


# Change directories without typing cd
setopt auto_cd
# Treat aliases as distinct commands for completion purposes
# setopt complete_aliases
# Remove commands from history that start with space
setopt hist_ignore_space
# Read and write history everytime
setopt share_history


# Case and hyphen insensitive
zstyle ":completion:*" matcher-list "m:{a-zA-Z-_}={A-Za-z_-}" "r:|=*" "l:|=* r:|=*"
# Case insensitive
# zstyle ":completion:*" matcher-list "m:{a-zA-Z}={A-Za-z}" "r:|=*" "l:|=* r:|=*"

# Colored completion listings
eval "$(dircolors -b)"
zstyle ":completion:*" list-colors "${(s.:.)LS_COLORS}"

# Completions with arrow keys
zstyle ":completion:*" menu select

# Completions for privileged commands
zstyle ":completion::complete:*" gain-privileges 1

# Cache completions
CUSTOM_COMP_CACHE_DIR=${CUSTOM_COMP_CACHE_DIR:-${XDG_CACHE_HOME:-$HOME/.cache}/zsh}
[[ ! -d ${CUSTOM_COMP_CACHE_DIR} ]] && mkdir -p "${CUSTOM_COMP_CACHE_DIR}"
zstyle ":completion:*" use-cache yes
zstyle ":completion:*:complete:*" cache-path "${CUSTOM_COMP_CACHE_DIR}"
unset CUSTOM_COMP_CACHE_DIR


# Zsh Colors
# autoload -Uz colors
# colors

# Completion system
autoload -Uz compinit
compinit

# Stop kill-word on directory delimiter
autoload -Uz select-word-style
select-word-style bash


source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Load zsh-syntax-highlighting at the end
# https://github.com/zsh-users/zsh-syntax-highlighting/issues/67
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

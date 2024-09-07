# Enable Powerlevel10k instant prompt. Should stay close to the top of .zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


function zcompile-many() {
  local f
  for f; do
    zcompile -R -- "$f".zwc "$f";
  done
}


if [[ -d "${ZDOTDIR}/aliases" ]]; then
  for file in "${ZDOTDIR}/aliases"/*(N); do
    source "$file"
  done
fi

[[ -d "${ZDOTDIR}/completions" ]] && fpath=( "${ZDOTDIR}/completions" "${fpath[@]}" )

if [[ -d "${ZDOTDIR}/functions" ]]; then
  fpath=( "${ZDOTDIR}/functions" "${fpath[@]}" )
  # Load functions
  autoload -Uz "${fpath[1]}"/*(:t)
fi


_ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/zsh"
# Zsh completion system
autoload -Uz compinit && compinit -d "${_ZSH_CACHE_DIR}/zcompdump"
[[ ${_ZSH_CACHE_DIR}/zcompdump.zwc -nt ${_ZSH_CACHE_DIR}/zcompdump ]] || zcompile -R "${_ZSH_CACHE_DIR}"/zcompdump


_ZSH_STATE_DIR="${XDG_STATE_HOME:-$HOME/.local/state}/zsh"
[[ ! -d ${_ZSH_STATE_DIR} ]] && mkdir -p "${_ZSH_STATE_DIR}"
HISTFILE="${_ZSH_STATE_DIR}/histfile"
HISTSIZE=50000
SAVEHIST=10000
unset _ZSH_STATE_DIR


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
# key[Control-Backspace]="${terminfo[kbs]}"
key[Alt-Left]="${terminfo[kLFT3]}"
key[Alt-Right]="${terminfo[kRIT3]}"

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
# [[ -n "${key[Control-Backspace]}" ]] && bindkey -- "${key[Control-Backspace]}" backward-kill-word
[[ -n "${key[Alt-Left]}" ]] && bindkey -- "${key[Alt-Left]}" backward-word
[[ -n "${key[Alt-Right]}" ]] && bindkey -- "${key[Alt-Right]}" forward-word

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
# Match files without explicitly specifying the dot
setopt globdots


# Zsh Colors
# autoload -Uz colors
# colors

# Stop kill-word on directory delimiter
autoload -Uz select-word-style
select-word-style bash


# Case and hyphen insensitive
zstyle ":completion:*" matcher-list "m:{a-zA-Z-_}={A-Za-z_-}" "r:|=*" "l:|=* r:|=*"
# Case insensitive
# zstyle ":completion:*" matcher-list "m:{a-zA-Z}={A-Za-z}" "r:|=*" "l:|=* r:|=*"

# Colored completion listings
if [[ -f ~/.dir_colors ]]; then
  eval "$(dircolors -b ~/.dir_colors)"
else
  eval "$(dircolors -b)"
fi
zstyle ":completion:*" list-colors "${(s.:.)LS_COLORS}"

# Completions with arrow keys
zstyle ":completion:*" menu select

# Completions for privileged commands
# zstyle ":completion::complete:*" gain-privileges 1

# Cache completions
[[ ! -d ${_ZSH_CACHE_DIR} ]] && mkdir -p "${_ZSH_CACHE_DIR}"
zstyle ":completion:*" use-cache yes
zstyle ":completion:*:complete:*" cache-path "${_ZSH_CACHE_DIR}"

unset _ZSH_CACHE_DIR


# ZSH_AUTOSUGGEST_MANUAL_REBIND=1
# Compile: `zcompile-many "${ZDOTDIR}"/zsh-autosuggestions/{zsh-autosuggestions.zsh,src/**/*.zsh}`
# source "${ZDOTDIR}"/zsh-autosuggestions/zsh-autosuggestions.zsh

# Load zsh-syntax-highlighting at the end
# https://github.com/zsh-users/zsh-syntax-highlighting/issues/67
# Compile: `zcompile-many "${ZDOTDIR}"/zsh-syntax-highlighting/{zsh-syntax-highlighting.zsh,highlighters/*/*.zsh}``
source "${ZDOTDIR}"/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# Powerlevel10k Ctrl+] to toggle right prompt
function toggle-right-prompt() { p10k display '*/right'=hide,show; }
zle -N toggle-right-prompt
bindkey '^]' toggle-right-prompt


if [[ -d "${ZDOTDIR}/plugins" ]]; then
  for file in "${ZDOTDIR}/plugins"/*/*.zsh(N); do
    source "$file"
  done
fi
unset file


# Source `code --locate-shell-integration-path zsh`. Speed up by resolving the
# path ahead of time. Also might need `POWERLEVEL9K_TERM_SHELL_INTEGRATION`
# https://github.com/microsoft/vscode/issues/165996
# https://github.com/microsoft/vscode/issues/184442
# [[ "$TERM_PROGRAM" == "vscode" ]] && source "/usr/lib/code/out/vs/workbench/contrib/terminal/browser/media/shellIntegration-rc.zsh"

# Fast Node Manager (fnm)
# eval "$(fnm env --use-on-cd)"

# Node Version Manager
# source /usr/share/nvm/init-nvm.sh


# Compile: `make -C "${ZDOTDIR}"/powerlevel10k pkg`
source "${ZDOTDIR}"/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit .p10k.zsh.
[[ ! -f ${ZDOTDIR:-$HOME}/.p10k.zsh ]] || source "${ZDOTDIR:-$HOME}/.p10k.zsh"

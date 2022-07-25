# https://wiki.archlinux.org/index.php/Dotfiles#Tracking_dotfiles_directly_with_Git
alias dotfiles='git --git-dir=${XDG_CONFIG_HOME:-$HOME/.config}/dotfiles/ --work-tree=$HOME'

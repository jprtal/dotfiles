# AUR helper
alias yay="paru"
alias yeet="paru -Rcs"
alias whee="paru -Sccd"
alias update="paru -Syu --newsonupgrade; echo; flatpak update"

# Mirrors
alias update-mirrors="sudo reflector --country France,Germany --age 4 --protocol https --sort rate --save /etc/pacman.d/mirrorlist"

alias pacfiles="find / -regextype posix-extended -regex '.+\.pac(new|save)' 2> /dev/null"

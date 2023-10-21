# Network
alias myip="curl -4 icanhazip.com; curl -6 icanhazip.com"
alias mydns="nmcli dev show | grep DNS"

# Adjust monitor brightness
alias bn="ddcutil setvcp 10"

# Misc
alias sound-cards="cat /proc/asound/cards | grep ' -'"

# cp
alias ccp="rsync --info=progress2 -ah"
alias sccp="sudo rsync --info=progress2 -ah"

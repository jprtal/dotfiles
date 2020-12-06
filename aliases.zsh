# https://wiki.archlinux.org/index.php/Dotfiles#Tracking_dotfiles_directly_with_Git
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# Adjust monitor brightness
alias bn="ddcutil setvcp 10"

alias myip="curl icanhazip.com"
alias mydns="nmcli dev show | grep DNS"

alias mitm="docker run --rm -it -v $HOME/.mitmproxy:/home/mitmproxy/.mitmproxy -p 8080:8080 mitmproxy/mitmproxy"
alias mitm-web="docker run --rm -it -v $HOME/.mitmproxy:/home/mitmproxy/.mitmproxy -p 8080:8080 -p 127.0.0.1:8081:8081 mitmproxy/mitmproxy mitmweb --web-host 0.0.0.0"
alias aulavirtual="python /opt/aula-virtual-dl/aula_virtual.py -r $HOME/Documents/aula_virtual -w 3 -c 1Q -u"

alias sound-cards="cat /proc/asound/cards | grep ' -'"

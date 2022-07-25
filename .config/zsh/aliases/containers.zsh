alias mitm="docker run --rm -it -v $HOME/.config/mitmproxy:/home/mitmproxy/.mitmproxy -p 8080:8080 mitmproxy/mitmproxy"
alias mitm-web='docker run --rm -it -v $HOME/.config/mitmproxy:/home/mitmproxy/.mitmproxy -p 8080:8080 -p 127.0.0.1:8081:8081 mitmproxy/mitmproxy mitmweb --web-host 0.0.0.0'

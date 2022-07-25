#!/usr/bin/env bash

hour=$(date +"%H")

if [ "$hour" -ge 7 ] && [ "$hour" -lt 22 ]; then
    systemd-cat echo "Setting GNOME Light Theme..."
    gsettings set org.gnome.desktop.interface color-scheme prefer-light
else
    systemd-cat echo "Setting GNOME Dark Theme..."
    gsettings set org.gnome.desktop.interface color-scheme prefer-dark
fi


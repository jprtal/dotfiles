#!/usr/bin/env bash

ICON="security-high"
if [[ "$XDG_SESSION_TYPE" == "x11" ]]; then
    ICON="security-low"
fi

notify-send "Using session" "<b>$XDG_SESSION_TYPE</b>" --icon=$ICON -e

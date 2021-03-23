#!/bin/bash

# Establish a connection between "Virtual" and the default port. This is needed until a better solution is found because routing Teams audio to an OBS Jack input client automatically with jack-matchmaker does some weird things.

oldifs="$IFS"
IFS=$'\n'
PORTS=($(jack_lsp | grep "$(pw-cli list-objects | grep -B 8 -A 2 $(cat ~/.config/pipewire/media-session.d/default-nodes | grep "default.configured.audio.sink" | cut -d'"' -f 6) | grep "node.description" | cut -d'"' -f 2)" | grep -E "(playback|out)"))
IFS="$oldifs"

pactl load-module module-null-sink sink_name=virtual_sink sink_properties=device.description="Virtual"

jack_connect "Virtual Monitor:monitor_FL" "${PORTS[0]}"
jack_connect "Virtual Monitor:monitor_FR" "${PORTS[1]}"

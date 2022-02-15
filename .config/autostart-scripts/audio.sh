#!/bin/bash

# Option 1
pw-loopback --capture-props='media.class=Audio/Sink node.name=virtual-sink node.description=Virtual'

# Option 2
# pactl load-module module-remap-sink sink_name=virtual-sink sink_properties=device.description="Virtual"

# Option 3
# pactl load-module module-null-sink media.class=Audio/Sink sink_name=virtual_sink sink_properties=device.description="Virtual"
# pactl load-module module-loopback source=virtual_sink.monitor sink=@DEFAULT_SINK@

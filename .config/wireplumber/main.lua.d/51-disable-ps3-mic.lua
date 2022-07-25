rule = {
    matches = {
      {
        { "device.description", "equals", "Sony Playstation Eye" },
      },
    },
    apply_properties = {
      ["device.disabled"] = true,
    },
}

table.insert(alsa_monitor.rules, rule)

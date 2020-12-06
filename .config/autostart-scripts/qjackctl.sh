#!/bin/bash

sleep 0.5
qjackctl &
systemctl --user restart pulseaudio.service

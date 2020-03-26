#!/bin/bash

# get command
command="$1"

# get data
currdevice=$(pacmd list-sinks | grep index | grep "*" | xargs | awk '{print $3}')

if [[ $command == "increase" ]]; then
    pactl set-sink-volume $currdevice +10%
fi
if [[ $command == "decrease" ]]; then
    pactl set-sink-volume $currdevice -10%
fi
if [[ $command == "mute" ]]; then
    pacmd set-sink-mute $currdevice toggle
fi

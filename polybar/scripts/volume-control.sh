#!/bin/bash

# Simple slider-like menu using Rofi
CURRENT=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -1)

CHOICE=$(printf "10\n20\n30\n40\n50\n60\n70\n80\n90\n100" | rofi -dmenu -p "Set Volume (Current: $CURRENT)" -width 20)

# Apply volume if user made a choice
if [[ -n "$CHOICE" ]]; then
    pactl set-sink-volume @DEFAULT_SINK@ "${CHOICE}%"
fi

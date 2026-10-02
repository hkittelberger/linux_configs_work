#!/bin/bash

# Use acpi to get battery info
battery_info=$(acpi -b)
charging=$(echo "$battery_info" | grep -qi "charging" && echo true || echo false)

percentage=$(echo "$battery_info" | grep -o '[0-9]\+%' | tr -d '%')
time=$(echo "$battery_info" | grep -o '[0-9]\+:[0-9]\+')

if [ -z "$percentage" ]; then
    echo "BAT: Unknown"
    exit
fi

# Icons
icon_discharging=""
icon_charging=""
icon_full=""

# Determine icon and whether to show time
if [ "$percentage" -ge 98 ]; then
    icon=$icon_full
    time_display=""
elif [ "$charging" = "true" ]; then
    icon=$icon_charging
    time_display=" (${time})"
else
    icon=$icon_discharging
    time_display=" (${time})"
fi

# Display format
echo "${percentage}%${time_display} $icon"

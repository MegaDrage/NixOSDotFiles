#!/usr/bin/env bash

battery_percent=$(acpi | grep -oP '\d+(?=%)')

if [ "$battery_percent" -ge 100 ]; then
    icon=""
elif [ "$battery_percent" -ge 75 ]; then
    icon=""
elif [ "$battery_percent" -ge 50 ]; then
    icon=""
elif [ "$battery_percent" -ge 25 ]; then
    icon=""
else
    icon=""
fi

echo "$icon : $battery_percent%"
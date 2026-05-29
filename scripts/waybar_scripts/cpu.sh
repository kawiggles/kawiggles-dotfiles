#!/bin/bash
# ~/.config/waybar/scripts/cpu.sh

CPU_UTIL=$(vmstat 1 2 | tail -1 | awk '{print 100 - $15}')
CPU_TEMP_RAW=$(cat /sys/class/hwmon/hwmon4/temp1_input)
CPU_TEMP=$((CPU_TEMP_RAW / 1000))

echo "CPU: ${CPU_UTIL}% ${CPU_TEMP}°C"

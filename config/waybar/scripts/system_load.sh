#!/bin/bash

# Get system load average
get_load() {
    load=$(cat /proc/loadavg | awk '{print $1}')
    echo $load
}

# Get load with icon
display_load() {
    load=$(get_load)
    load_float=$(echo "$load" | cut -d. -f1)
    
    # Choose icon based on load level
    if [ "$load_float" -le 1 ]; then
        icon="󰾆"  # Low load - green
    elif [ "$load_float" -le 3 ]; then
        icon="󰾅"  # Medium load - yellow
    else
        icon="󰓅"  # High load - red
    fi
    
    echo "$icon $load"
}

# Handle arguments
case $1 in
    "load"|*)
        display_load
        ;;
esac
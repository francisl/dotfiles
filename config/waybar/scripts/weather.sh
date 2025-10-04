#!/bin/bash

# Simple weather using wttr.in (requires internet)
# You can customize the city by changing the URL

get_weather() {
    # Replace "YourCity" with your location or remove ?0 for auto-location
    weather=$(curl -s "wttr.in/?format=1" 2>/dev/null)
    if [ -z "$weather" ]; then
        echo "🌐 No connection"
    else
        echo "$weather"
    fi
}

# Handle arguments
case $1 in
    "weather"|*)
        get_weather
        ;;
esac
#!/bin/bash

# Function to show usage
usage() {
    echo "Usage:"
    echo "  xcodetools.sh preview-shutdown   - Shutdown all simulator previews"
    echo "  xcodetools.sh preview-deletecache - Delete all simulator preview caches"
    exit 1
}

# Check if an argument is provided
if [ $# -eq 0 ]; then
    usage
fi

# Handle different commands
case "$1" in 
    "preview-shutdown")
        xcrun simctl shutdown all
        ;;
    "preview-deletecache")
        xcrun simctl delete all
        ;;
    *)
        usage
        ;;
esac


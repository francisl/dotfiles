#!/bin/bash
#                    __
#  _    _____ ___ __/ /  ___ _____
# | |/|/ / _ `/ // / _ \/ _ `/ __/
# |__,__/\_,_/\_, /_.__/\_,_/_/
#            /___/

exec 200>/tmp/waybar-launch.lock
flock -n 200 || exit 0

# -----------------------------------------------------
# Quit all running waybar instances
# -----------------------------------------------------
killall waybar || true
pkill waybar || true

# Launch waybar without parameters (it will use the symbolic links)
waybar &

# Explicitly release the lock (optional) -> flock releases on exit
flock -u 200
exec 200>&-

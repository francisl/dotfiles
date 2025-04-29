# Set window root path. Default is `$session_root`.
# Must be called before `new_window`.
window_root "~/workspace/WonderTime"

# Create new window. If no argument is given, window name will be based on
# layout file name.
new_window "wondertime-workspace"

# Split window into panes.
split_h 30
split_v 40

# Run commands.
run_cmd "nvim" 1
run_cmd "cd WonderTime/frontend && npm run dev" 2     # runs in active pane
run_cmd "cd WonderTime/frontend && nu" 3

# Set active pane.
select_pane 1

# HOW TO RUN USE
# > tmuxifier load-window ws-storywonder

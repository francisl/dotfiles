-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Font configuration (from Ghostty)
config.font = wezterm.font('MesloLGS Nerd Font Mono')
config.font_size = 13

-- Background and transparency (from Ghostty)
config.window_background_opacity = 0.9
config.macos_window_background_blur = 6

-- Window configuration
config.initial_cols = 120
config.initial_rows = 28

-- Automatic theme switching based on system appearance (from Ghostty's dark:UnderTheSea,light:primary)
local function scheme_for_appearance(appearance)
  if appearance:find "Dark" then
    -- Using a dark theme similar to UnderTheSea
    return "Oceanic Next"  -- Alternative options: "Tomorrow Night", "Dracula", "Monokai Dark"
  else
    -- Using a light theme similar to primary
    return "Tomorrow"  -- Alternative options: "GitHub", "Solarized Light", "Novel"
  end
end

-- Set up automatic appearance switching
wezterm.on("window-config-reloaded", function(window, pane)
  local overrides = window:get_config_overrides() or {}
  local appearance = window:get_appearance()
  local scheme = scheme_for_appearance(appearance)
  if overrides.color_scheme ~= scheme then
    overrides.color_scheme = scheme
    window:set_config_overrides(overrides)
  end
end)

-- Key bindings (from Ghostty)
config.keys = {
  -- Toggle quick terminal equivalent (cmd+shift+space from Ghostty)
  -- WezTerm doesn't have exact toggle_quick_terminal, so this spawns a new window
  {
    key = ' ',
    mods = 'CMD|SHIFT',
    action = wezterm.action.SpawnWindow,
  },
  
  -- Additional useful key bindings:
  -- Split panes
  {
    key = 'd',
    mods = 'CMD',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'd',
    mods = 'CMD|SHIFT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
}

-- Window appearance
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true

-- macOS-specific settings
config.native_macos_fullscreen_mode = false

-- Finally, return the configuration to wezterm:
return config


-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.colors = {
-- 	foreground = "#CBE0F0",
-- 	background = "#011423",
-- 	cursor_bg = "#47FF9C",
-- 	cursor_border = "#47FF9C",
-- 	cursor_fg = "#011423",
-- 	selection_bg = "#706b4e",
-- 	selection_fg = "#f3d9c4",
-- 	ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#24EAF7" },
-- 	brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
-- }

function scheme_for_appearance(appearance)
  if appearance:find "Dark" then
    -- return "Catppuccin Macchiato"
    -- return 'Abernathy'
    -- return 'Argonaut (Gogh)'
    return 'Ayu Dark (Gogh)'
  else
    return "Catppuccin Latte"
  end
end

config.color_scheme = scheme_for_appearance(wezterm.gui.get_appearance())

-- config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font = wezterm.font("DroidSansM Nerd Font")
-- config.font = wezterm.font("Spot Mono")
-- config.font = wezterm.font("SpaceMono Nerd Font")
-- config.font = wezterm.font("ZedMono Nerd Font Mono")
-- config.font = wezterm.font("Pt Mono")
-- config.font = wezterm.font("VictorMono Nerd Font Mono")

config.font_size = 14

config.enable_tab_bar = true 
config.hide_tab_bar_if_only_one_tab = true

config.window_decorations = "TITLE | RESIZE"
config.window_background_opacity = 0.9
config.macos_window_background_blur = 9

config.send_composed_key_when_left_alt_is_pressed = false
config.term = "xterm-256color"

config.keys = {
  {
    key = 'k',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ClearScrollback('ScrollbackAndViewport')
  }
}
-- and finally, return the configuration to wezterm

config.selection_word_boundary = '{}[]()"\'`,;: '

config.use_ime=false

return config


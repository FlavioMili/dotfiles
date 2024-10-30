-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.initial_cols = 96
config.initial_rows = 32
-- config.color_scheme = "Bearded Arc"
-- config.color_scheme = "Lunaria Light (Gogh)"
config.color_scheme = 'Monokai (base16)'
config.font = wezterm.font("ComicShannsMono Nerd Font")
config.font_size = 17

config.enable_tab_bar = true
config.window_decorations = "RESIZE"
config.native_macos_fullscreen_mode = true

-- config.text_background_opacity = 0.2
-- config.window_background_opacity = 0.5
config.macos_window_background_blur = 25
config.window_background_opacity = 0.3
-- Key bindings
local act = wezterm.action
config.keys = {
	{ key = "t", mods = "CMD", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "w", mods = "CMD", action = act.CloseCurrentTab({ confirm = true }) },
  { key = 'F', mods = 'CMD|SHIFT', action = wezterm.action.ToggleFullScreen },
}
wezterm.on("window-resized", function(window, pane)
  if window:get_dimensions().is_full_screen then
    window:set_config_overrides({
      window_background_opacity = 1.0,
    })
  else
    window:set_config_overrides({
      window_background_opacity = 0.3,
    })
  end
end)

-- and finally, return the configuration to wezterm
return config

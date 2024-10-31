-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.initial_cols = 110
config.initial_rows = 36
-- config.color_scheme = "Bearded Arc"
config.color_scheme = 'Monokai (base16)'
config.font = wezterm.font("ComicShannsMono Nerd Font")
config.font_size = 17

config.window_decorations = "RESIZE"
config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.native_macos_fullscreen_mode = true
config.tab_bar_at_bottom = true

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


config.window_frame = {
  font = wezterm.font { family = 'Roboto', weight = 'Medium' },
  font_size = 11.0,inactive_titlebar_bg = "none",
        active_titlebar_bg = "none",
}

config.colors = {
  tab_bar = {
    -- The color of the inactive tab bar edge/divider
    inactive_tab_edge = '#739402',
  },
}


return config

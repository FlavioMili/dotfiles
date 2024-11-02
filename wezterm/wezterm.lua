-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.initial_cols = 130
config.initial_rows = 40
-- config.color_scheme = "Bearded Arc"
config.color_scheme = 'Monokai (base16)'
config.font = wezterm.font("ComicShannsMono Nerd Font")
config.font_size = 16
config.window_decorations = "RESIZE"
config.native_macos_fullscreen_mode = true

-- config.enable_tab_bar = false
config.use_fancy_tab_bar = true
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true
config.show_new_tab_button_in_tab_bar = false
-- config.text_background_opacity = 0.1
config.macos_window_background_blur = 25
config.window_background_opacity = 0.35
config.window_padding = { bottom = 0 }

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
	active_titlebar_bg = "none",
}

return config

-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.initial_cols = 124
config.initial_rows = 38
-- config.color_scheme = "Bearded Arc"
config.color_scheme = 'Monokai (base16)'
config.font = wezterm.font("ComicShannsMono Nerd Font")
config.font_size = 17
config.window_decorations = "RESIZE"
config.native_macos_fullscreen_mode = true

config.enable_tab_bar = false
-- config.use_fancy_tab_bar = true
-- config.tab_bar_at_bottom = true
-- config.hide_tab_bar_if_only_one_tab = true
-- config.show_new_tab_button_in_tab_bar = false
-- config.show_tabs_in_tab_bar = true
-- config.switch_to_last_active_tab_when_closing_tab = false
-- config.tab_and_split_indices_are_zero_based = false
-- config.tab_max_width = 12
-- config.text_background_opacity = 0.2
-- config.window_background_opacity = 0.5
config.macos_window_background_blur = 25
config.window_background_opacity = 0.35
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
  font_size = 11.0,
	inactive_titlebar_bg = "none",
	active_titlebar_bg = "none",
}

return config

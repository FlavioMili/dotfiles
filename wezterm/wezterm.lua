-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.initial_cols = 144
config.initial_rows = 44
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
config.max_fps = 240
-- Key bindings
local act = wezterm.action
config.keys = {
  { key = "t", mods = "CMD", action = act.SpawnTab("CurrentPaneDomain") },
  { key = 'F', mods = 'CMD|SHIFT', action = wezterm.action.ToggleFullScreen },
  { key = 'w', mods = 'CMD', action = wezterm.action.CloseCurrentPane { confirm = true } },
  { key = 'H', mods = 'CMD|SHIFT', action = wezterm.action.SplitPane { direction = 'Left' } },
  { key = 'L', mods = 'CMD|SHIFT', action = wezterm.action.SplitPane { direction = 'Right' } },
  { key = 'J', mods = 'CMD|SHIFT', action = wezterm.action.SplitPane { direction = 'Down' } },
  { key = 'K', mods = 'CMD|SHIFT', action = wezterm.action.SplitPane { direction = 'Up' } },
  { key = 'k', mods = "CMD", action = act.ActivatePaneDirection('Up') },
  { key = 'j', mods = "CMD", action = act.ActivatePaneDirection('Down') },
  { key = 'h', mods = "CMD", action = act.ActivatePaneDirection('Left') },
  { key = 'l', mods = "CMD", action = act.ActivatePaneDirection('Right') },
  { key = 'H', mods = 'ALT|SHIFT', action = act.AdjustPaneSize { 'Left', 3 }, },
  { key = 'J', mods = 'ALT|SHIFT', action = act.AdjustPaneSize { 'Down', 3 }, },
  { key = 'K', mods = 'ALT|SHIFT', action = act.AdjustPaneSize { 'Up', 3 } },
  { key = 'L', mods = 'ALT|SHIFT', action = act.AdjustPaneSize { 'Right', 3 }, },
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

local wezterm = require("wezterm")
local smart_splits = wezterm.plugin.require('https://github.com/mrjones2014/smart-splits.nvim')
local config = wezterm.config_builder()

config.color_scheme = "Gruvbox Dark (Gogh)"
config.font = wezterm.font("FiraCode Nerd Font")
config.font_size = 14.0
config.window_decorations = "TITLE|RESIZE"
config.use_fancy_tab_bar = false
config.window_close_confirmation = "AlwaysPrompt"
config.default_prog = { "powershell.exe" }
config.hide_tab_bar_if_only_one_tab = true
config.adjust_window_size_when_changing_font_size = false


config.leader = { key = "b", mods = "CTRL", timeout_milliseconds = 1000 }

config.keys = {
    { key = 'v',mods = "LEADER",       action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
    { key = 's',mods = "LEADER",       action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
	{ key = "z", mods = "LEADER",       action="TogglePaneZoomState" },
	{ key = "c", mods = "LEADER",       action=wezterm.action{SpawnTab="CurrentPaneDomain"}},
	{ key = "1", mods = "LEADER",       action=wezterm.action{ActivateTab=0}},
    { key = "2", mods = "LEADER",       action=wezterm.action{ActivateTab=1}},
    { key = "3", mods = "LEADER",       action=wezterm.action{ActivateTab=2}},
    { key = "4", mods = "LEADER",       action=wezterm.action{ActivateTab=3}},
    { key = "5", mods = "LEADER",       action=wezterm.action{ActivateTab=4}},
    { key = "6", mods = "LEADER",       action=wezterm.action{ActivateTab=5}},
    { key = "7", mods = "LEADER",       action=wezterm.action{ActivateTab=6}},
    { key = "8", mods = "LEADER",       action=wezterm.action{ActivateTab=7}},
    { key = "9", mods = "LEADER",       action=wezterm.action{ActivateTab=8}},
    { key = "&", mods = "LEADER|SHIFT", action=wezterm.action{CloseCurrentTab={confirm=true}}},
    { key = "d", mods = "LEADER",       action=wezterm.action{CloseCurrentPane={confirm=true}}},
    { key = "x", mods = "LEADER",       action=wezterm.action{CloseCurrentPane={confirm=true}}},
    { key = 'H', mods = 'SHIFT', action = wezterm.action.ActivateTabRelative(-1), },
    { key = 'L', mods = 'SHIFT', action = wezterm.action.ActivateTabRelative(1), },
}

smart_splits.apply_to_config(config)
return config

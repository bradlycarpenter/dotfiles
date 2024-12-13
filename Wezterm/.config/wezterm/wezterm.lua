local wezterm = require("wezterm")
local smart_splits = wezterm.plugin.require("https://github.com/mrjones2014/smart-splits.nvim")
local config = wezterm.config_builder()
local is_windows = wezterm.target_triple:find("windows") ~= nil

config.color_scheme = "Gruvbox Dark (Gogh)"
config.font = wezterm.font("FiraCode Nerd Font")
config.font_size = 14
config.window_decorations = "TITLE|RESIZE"
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.window_close_confirmation = "AlwaysPrompt"
config.term = "wezterm"

if is_windows then
	config.default_prog = { "powershell.exe" }
else
	config.default_prog = { "zsh" }
end

config.hide_tab_bar_if_only_one_tab = true
config.adjust_window_size_when_changing_font_size = false

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }

config.keys = {
	{ key = "v", mods = "LEADER", action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
	{ key = "h", mods = "LEADER", action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
	{ key = "z", mods = "LEADER", action = "TogglePaneZoomState" },
	{ key = "c", mods = "LEADER", action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }) },
	{ key = "1", mods = "LEADER", action = wezterm.action({ ActivateTab = 0 }) },
	{ key = "2", mods = "LEADER", action = wezterm.action({ ActivateTab = 1 }) },
	{ key = "3", mods = "LEADER", action = wezterm.action({ ActivateTab = 2 }) },
	{ key = "4", mods = "LEADER", action = wezterm.action({ ActivateTab = 3 }) },
	{ key = "5", mods = "LEADER", action = wezterm.action({ ActivateTab = 4 }) },
	{ key = "6", mods = "LEADER", action = wezterm.action({ ActivateTab = 5 }) },
	{ key = "7", mods = "LEADER", action = wezterm.action({ ActivateTab = 6 }) },
	{ key = "8", mods = "LEADER", action = wezterm.action({ ActivateTab = 7 }) },
	{ key = "9", mods = "LEADER", action = wezterm.action({ ActivateTab = 8 }) },
	{ key = "&", mods = "LEADER|SHIFT", action = wezterm.action({ CloseCurrentTab = { confirm = true } }) },
	{ key = "d", mods = "LEADER", action = wezterm.action({ CloseCurrentPane = { confirm = true } }) },
	{ key = "x", mods = "LEADER", action = wezterm.action({ CloseCurrentPane = { confirm = true } }) },
	{
		key = "i",
		mods = "ALT",
		action = wezterm.action.ActivateTabRelative(-1),
	},
	-- Navigate to the right tab
	{
		key = "o",
		mods = "ALT",
		action = wezterm.action.ActivateTabRelative(1),
	},
	{
		key = "i",
		mods = "ALT|SHIFT",
		action = wezterm.action.MoveTabRelative(-1),
	},
	-- Navigate to the right tab
	{
		key = "o",
		mods = "ALT|SHIFT",
		action = wezterm.action.MoveTabRelative(1),
	},
}

smart_splits.apply_to_config(config, {
  direction_keys = { 'h', 'j', 'k', 'l' },
  modifiers = {
    move = 'CTRL', -- modifier to use for pane movement, e.g. CTRL+h to move left
    resize = 'ALT', -- modifier to use for pane resize, e.g. ALT+h to resize to the left
  },
})
return config

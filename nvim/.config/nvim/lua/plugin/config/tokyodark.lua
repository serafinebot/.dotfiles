vim.o.background = "dark"

local status, tokyonight = pcall(require, "tokyonight")
if not status then
	print("ERROR: module \"tokyonight\" not found")
	return
end

tokyonight.setup({
	style = "night",
	light_style = "day",
	transparent = false,
	terminal_colors = true,
	styles = {
		comments = { italic = false },
		keywords = { italic = false },
		functions = {},
		variables = {},
		sidebars = "dark",
		floats = "dark",
	},
	sidebars = { "qf", "help", "packer" },
	day_brightness = 0.3,
	hide_inactive_statusline = false,
	dim_inactive = false,
	lualine_bold = false,

	--- You can override specific color groups to use other groups or a hex color
	--- function will be called with a ColorScheme table
	-- - @param colors ColorScheme
	on_colors = function(_) end,

	--- You can override specific highlights to use other groups or a hex color
	--- function will be called with a Highlights and ColorScheme table
	-- @param highlights Highlights
	-- @param colors ColorScheme
	on_highlights = function(highlights, colors)
		local prompt = "#2d3149"
		highlights.TelescopeNormal = {
			bg = colors.bg_dark,
			fg = colors.fg_dark,
		}
		highlights.TelescopeBorder = {
			bg = colors.bg_dark,
			fg = colors.bg_dark,
		}
		highlights.TelescopePromptNormal = {
			bg = prompt,
		}
		highlights.TelescopePromptBorder = {
			bg = prompt,
			fg = prompt,
		}
		highlights.TelescopePromptTitle = {
			bg = prompt,
			fg = prompt,
		}
		highlights.TelescopePreviewTitle = {
			bg = colors.bg_dark,
			fg = colors.bg_dark,
		}
		highlights.TelescopeResultsTitle = {
			bg = colors.bg_dark,
			fg = colors.bg_dark,
		}
	end,
})

vim.cmd("colorscheme tokyonight-night")

-- file navigation
require("plugin.config.telescope")
require("plugin.config.nvim-tree")
require("plugin.config.harpoon")

-- syntax highlighting
require("plugin.config.nvim-treesitter")

-- git
require("plugin.config.gitsigns")
require("plugin.config.diffview")
require("plugin.config.git-worktree")

-- theme
require("plugin.config.luatab")
require("plugin.config.lualine")
require("plugin.config.tokyodark")

-- languages
require("plugin.config.vimtex")

-- misc
require("plugin.config.comment")
require("plugin.config.nvim-autopairs")
require("plugin.config.nvim-colorizer")
require("plugin.config.indent-blankline")

-- obsidian
require("plugin.config.obsidian")

-- dap
require("plugin.config.dap")

-- lsp & completion
require("plugin.config.mason")
require("plugin.config.lspconfig")
-- require("plugin.config.luasnip") -- disabled due to perfomance issues
require("plugin.config.nvim-cmp")
require("plugin.config.lspkind")
require("plugin.config.neodev")
require("plugin.config.spellwarn")

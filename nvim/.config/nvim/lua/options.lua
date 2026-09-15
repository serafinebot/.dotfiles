-- vim.opt.tabstop = 4
-- vim.opt.shiftwidth = 4
-- vim.opt.expandtab = false

-- misc
-- NOTE: "syntax on" and "filetype plugin indent on" are Neovim defaults.
-- Running them here triggers filetype detection for the initial buffer before
-- lazy.nvim registers its handlers, which breaks ft-lazy-loading on first open.
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.mouse = "a"
vim.opt.backspace = { "indent", "eol", "start" }

-- view
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.signcolumn = "yes"
vim.opt.guicursor = "n-v-i-c-r-t:block"

-- indentation
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.wrap = false

-- search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- persistent undo
local undodir = vim.fn.stdpath("state") .. "/undo"
vim.fn.mkdir(undodir, "p")
vim.opt.undodir = undodir
vim.opt.undofile = true

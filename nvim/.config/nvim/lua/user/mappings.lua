local function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then options = vim.tbl_extend('force', options, opts) end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local function unmap(mode, lhs)
	pcall(vim.api.nvim_del_keymap, mode, lhs)
end

-- remap space as leader key
map("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- NORMAL --
-- move between windows
unmap("n", "<leader>h")
unmap("n", "<leader>j")
unmap("n", "<leader>k")
unmap("n", "<leader>l")

map("n", "<leader>h", "<C-w>h")
map("n", "<leader>j", "<C-w>j")
map("n", "<leader>k", "<C-w>k")
map("n", "<leader>l", "<C-w>l")

-- resize windows
map("n", "<Up>", "<cmd>resize +2<CR>")
map("n", "<Down>", "<cmd>resize -2<CR>")
map("n", "<Left>", "<cmd>vertical resize +2<CR>")
map("n", "<Right>", "<cmd>vertical resize -2<CR>")

-- disable highlight
map("n", "<C-g>", "<cmd>noh<CR>")

-- jump to previous file
map("n", "<leader>fe", "<cmd>e#<CR>")

-- navigate buffers
-- map("n", "<C-k>", "<cmd>bnext<CR>") -- disabled this in favour of nvim-cmp
-- map("n", "<C-j>", "<cmd>bprevious<CR>") -- disabled this in favour of nvim-cmp

-- navigate tabs
map("n", "<C-l>", "<cmd>tabnext<CR>")
map("n", "<C-h>", "<cmd>tabprevious<CR>")

-- wq aliases
vim.cmd("cnoreabbrev W w")
vim.cmd("cnoreabbrev Q q")
vim.cmd("cnoreabbrev Wq wq")
vim.cmd("cnoreabbrev wQ wq")
vim.cmd("cnoreabbrev WQ wq")
map("n", "<C-q>", "<cmd>q<CR>")
map("n", "<C-S-q>", "<cmd>q!<CR>")

-- tabnew aliases
vim.cmd("cnoreabbrev Tabnew tabnew")
vim.cmd("cnoreabbrev TAbnew tabnew")

-- copy to clipboard
map("v", "<leader>y", "\"+y")
map("n", "<leader>Y", "\"+yg_")
map("n", "<leader>y", "\"+yy")

-- paste from clipboard
map("n", "<leader>p", "\"+p")
map("n", "<leader>P", "\"+P")
map("v", "<leader>p", "\"+p")
map("v", "<leader>P", "\"+P")

--  center cursor when <C-u> and <C-d>
map("n", "<C-u>", "<C-u>zz0")
map("n", "<C-d>", "<C-d>zz0")

-- center cursor when cycling through search
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- VISUAL --
-- indent while in visual mode
map("v", ">", ">gv")
map("v", "<", "<gv")

-- move selected block
map("v", "K", ":m '<-2<CR>gv=gv") -- using : as <cmd> provokes unwanted behaviour
map("v", "J", ":m '>+1<CR>gv=gv")

-- maintain copied text after visual paste
map("v", "p", '"_dP')

-- spell

function spell_toggle()
	vim.opt.spell = not vim.opt.spell:get()
	if vim.opt.spell:get() then
		print("spellcheck on")
	else
		print("spellcheck off")
	end
end

vim.keymap.set("n", "<leader>st", spell_toggle, { silent = true })
vim.keymap.set("n", "<leader>se", function() vim.opt_local.spelllang = "en" end)
vim.keymap.set("n", "<leader>ss", function() vim.opt_local.spelllang = "es" end)
vim.keymap.set("n", "<leader>sb", function() vim.opt_local.spelllang = "es,en" end)

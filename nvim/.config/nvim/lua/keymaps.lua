-- shift+enter inserts a newline (jupynvim overrides this in .ipynb buffers)
vim.keymap.set("i", "<S-CR>", "<C-v><C-j>")

-- copy/paste from clipboard
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>p", '"+p')
vim.keymap.set("v", "<leader>P", '"+P')
vim.keymap.set("n", "<leader>p", '"+p')
vim.keymap.set("n", "<leader>P", '"+P')

-- move between pane splits
vim.keymap.set("n", "<leader>h", "<C-w>h")
vim.keymap.set("n", "<leader>j", "<C-w>j")
vim.keymap.set("n", "<leader>k", "<C-w>k")
vim.keymap.set("n", "<leader>l", "<C-w>l")

-- resize splits
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<CR>")
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<CR>")
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<CR>")
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<CR>")

-- move between tabs
vim.keymap.set("n", "<C-l>", "<cmd>tabnext<CR>")
vim.keymap.set("n", "<C-h>", "<cmd>tabprevious<CR>")

-- disable highlight
vim.keymap.set("n", "<C-g>", "<cmd>noh<CR>")

-- jump to previous file
vim.keymap.set("n", "<leader>fe", "<cmd>e#<CR>")

-- center cursor when cycling through search
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- indent while in visual mode
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

-- move selected block
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- quality of life keymaps
vim.keymap.set("n", "<leader>w", "<cmd>write<cr>")
vim.keymap.set("n", "<leader>q", "<cmd>quit<cr>")
vim.keymap.set("n", "<esc>", "<cmd>nohlsearch<cr>")

-- accept common capitalization typos when saving and quitting.
local save_quit_commands = { "W", "W!", "Q", "Q!", "Wq", "Wq!", "wQ", "wQ!", "WQ", "WQ!" }

for _, command in ipairs(save_quit_commands) do
  vim.cmd(([[cnoreabbrev <expr> %s getcmdtype() == ':' && getcmdline() ==# '%s' ? '%s' : '%s']]):format(
    command,
    command,
    command:lower(),
    command
  ))
end

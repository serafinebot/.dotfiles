local telescope_status, telescope = pcall(require, "telescope")
if not telescope_status then
	print("ERROR: module \"telescope\" found")
	return
end

telescope.setup({
	defaults = {
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--hidden",
			"--no-ignore",
		},
		-- Default configuration for telescope goes here:
		-- config_key = value,
		mappings = {
			i = {
				-- map actions.which_key to <C-h> (default: <C-/>)
				-- actions.which_key shows the mappings for your picker,
				-- e.g. git_{create, delete, ...}_branch for the git_branches picker
				["<C-h>"] = "which_key"
			}
		}
	},
	pickers = {
		find_files = {
			find_command = {
				"rg",
				"--color=never",
				"--files",
				"--no-ignore",
				"--hidden"
			},
		}
	},
	extensions = {
		-- Your extension configuration goes here:
		-- extension_name = {
		--   extension_config_key = value,
		-- }
		-- please take a look at the readme of the extension you want to configure
	}
})

local builtin_status, builtin = pcall(require, "telescope.builtin")
if not builtin_status then
	print("ERROR: module \"telescope.builtin\" not found")
	return
end

-- telescope.load_extension("live_grep_args")
-- rg --color=never --no-heading --with-filename --line-number --column --smart-case

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "find files" })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "live grep" })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "buffers" })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "help tags" })
vim.keymap.set('n', '<leader>fC', builtin.colorscheme, { desc = "colorscheme" })

-- LSP
vim.keymap.set('n', 'gd', builtin.lsp_definitions, { desc = "jump to definition" })
vim.keymap.set('n', 'gr', builtin.lsp_references, { desc = "jump to references" })
vim.keymap.set('n', 'gi', builtin.lsp_implementations, { desc = "jump to implementation" })
vim.keymap.set('n', 'gt', builtin.lsp_type_definitions, { desc = "jump to type definitions" })
vim.keymap.set('n', '<leader>dd', builtin.diagnostics, { desc = "diagnostics" })

-- vim.keymap.set('n', '<leader>f?', builtin.lsp_incoming_calls, { desc = "" })
-- vim.keymap.set('n', '<leader>f?', builtin.lsp_outgoing_calls, { desc = "" })
-- vim.keymap.set('n', '<leader>f?', builtin.lsp_document_symbols, { desc = "" })
-- vim.keymap.set('n', '<leader>f?', builtin.lsp_workspace_symbols, { desc = "" })
-- vim.keymap.set('n', '<leader>f?', builtin.lsp_dynamic_workspace_symbols, { desc = "" })

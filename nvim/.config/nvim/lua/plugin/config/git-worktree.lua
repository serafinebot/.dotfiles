local git_worktree_status, git_worktree = pcall(require, "git-worktree")
if not git_worktree_status then
	print("ERROR: module \"git-worktree\" not found")
	return
end

git_worktree.setup({
	change_directory_command = "cd",
	update_on_change = true,
	update_on_change_command = "e .",
	clearjumps_on_change = true,
	autopush = false
})

local telescope_status, telescope = pcall(require, "telescope")
if not telescope_status then
	print("ERROR: module \"telescope\" not found")
	return
end

telescope.load_extension("git_worktree")

vim.keymap.set("n", "<leader>gw", "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>")
vim.keymap.set("n", "<leader>gc", "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>")

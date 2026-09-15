return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      view = {
        side = "right",
        width = 35,
      },
      filters = {
        git_ignored = false,
      },
    })

    vim.keymap.set("n", "<leader>o", "<cmd>NvimTreeToggle<cr>")
  end,
}

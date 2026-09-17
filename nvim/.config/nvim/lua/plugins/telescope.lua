return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    defaults = {
      file_ignore_patterns = {
        "node_modules/",
        "%.git/",
        "%.venv/",
        "__pycache__/",
        "%.mypy_cache/",
        "%.ruff_cache/",
        "%.pyc$",
        "%.o$",
      },
    },
    pickers = {
      find_files = {
        hidden = true,
        no_ignore = true,
      },
      live_grep = {
        hidden = true,
        no_ignore = true,
      },
    },
  },
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>" },
    { "<leader>fc", "<cmd>Telescope colorscheme<cr>" },
  },
}

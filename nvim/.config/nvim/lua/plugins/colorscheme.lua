return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    opts = {},
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("kanagawa").setup({})
    end,
  },
  -- more theme candidates can go here; the scheme is applied at the end of
  -- init.lua, after all plugin setup
}

return {
  "sheng-tse/jupynvim",
  build = function(plugin)
    local install = loadfile(plugin.dir .. "/lua/jupynvim/install.lua")()
    install.run(plugin)
  end,
  config = function()
    require("jupynvim").setup({
      image_renderer = "placeholder",
      remote = {
        arch = {
          host = "arch",
          core_path = "~/.local/bin/jupynvim-core"
        }
      },
      keymaps = {
        run_advance = "<S-CR>",
        run_advance_alt = "<leader>nr",
        run_above = "<leader>nA",
        run_below = "<leader>nB",
        delete_cell = "<leader>nd",
        start_kernel = "<leader>ns",
        stop_kernel = "<leader>nS",
        restart_kernel = "<leader>nx",
        clear_output = "<leader>nc",
        clear_all = "<leader>nC",
        run_stay = "<C-CR>",
        run_all = "<leader>nR",
        add_above = "<leader>na",
        add_below = "<leader>nb",
        move_up = "<leader>nk",
        move_down = "<leader>nj",
        pick_kernel = "<leader>nK",
        interrupt_kernel = "<leader>ni",
        refresh = "<leader>nL",
      }
    })

    -- rebind cellmode's edit -> command key from <Esc> to <C-c>
    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        local buf = args.buf
        local is_nb = vim.b[buf].jupynvim_filetype ~= nil or vim.fn.bufname(buf):match("%.ipynb$")
        if not is_nb then return end
        vim.defer_fn(function()
          if not vim.api.nvim_buf_is_valid(buf) then return end
          local cellmode = require("jupynvim.notebook.cellmode")
          vim.keymap.set("n", "<C-c>", function()
            cellmode.enter_command(buf)
          end, { buffer = buf, silent = true, desc = "jupynvim: cell command mode" })
          pcall(vim.keymap.del, "n", "<Esc>", { buffer = buf })
        end, 50)
      end,
    })
  end,
}

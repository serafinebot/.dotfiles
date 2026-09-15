return {
  "neovim/nvim-lspconfig",
  config = function()
    vim.keymap.set("n", "gd", vim.lsp.buf.definition)
    vim.keymap.set("n", "gr", vim.lsp.buf.references)
    vim.keymap.set("n", "K", vim.lsp.buf.hover)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)

    vim.api.nvim_create_user_command("Mypy", function()
      if vim.fn.executable("mypy") == 0 then
        vim.notify("mypy is not installed", vim.log.levels.ERROR)
        return
      end

      vim.cmd.write()

      local output = vim.fn.systemlist({ "mypy", "." })
      vim.fn.setqflist({}, "r", {
        title = "mypy",
        lines = output,
        efm = "%f:%l:%c: %trror: %m,%f:%l: %trror: %m,%f:%l:%c: %tarning: %m,%f:%l: %tarning: %m",
      })

      if vim.v.shell_error == 0 then
        vim.cmd.cclose()
        vim.notify("mypy passed")
      else
        vim.cmd.copen()
      end
    end, {})

    vim.keymap.set("n", "<leader>cm", "<cmd>Mypy<cr>")

    -- diagnostics as virtual text
    vim.diagnostic.config({ virtual_text = true })

    -- completion capabilities for blink.cmp
    vim.lsp.config("*", { capabilities = require("blink.cmp").get_lsp_capabilities() })

    vim.lsp.enable({ "lua_ls", "pyright", "ruff", "clangd", "gopls", "jdtls", "ada_ls" })
  end,
}

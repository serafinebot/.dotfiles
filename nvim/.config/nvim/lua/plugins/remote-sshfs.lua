return {
  "nosduco/remote-sshfs.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
  },
  cmd = {
    "RemoteSSHFSConnect",
    "RemoteSSHFSDisconnect",
    "RemoteSSHFSEdit",
    "RemoteSSHFSFindFiles",
    "RemoteSSHFSLiveGrep",
  },
  keys = {
    { "<leader>rc", function() require("remote-sshfs.api").connect() end, desc = "ssh: connect" },
    { "<leader>rd", function() require("remote-sshfs.api").disconnect() end, desc = "ssh: disconnect" },
    { "<leader>re", function() require("remote-sshfs.api").edit() end, desc = "ssh: edit config" },
    { "<leader>rf", function() require("remote-sshfs.api").find_files() end, desc = "ssh: find files" },
    { "<leader>rg", function() require("remote-sshfs.api").live_grep() end, desc = "ssh: live grep" },
  },
  config = function()
    require("remote-sshfs").setup({})
    require("telescope").load_extension("remote-sshfs")
  end,
}

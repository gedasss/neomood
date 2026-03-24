return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      plugins = { spelling = true },
    },
    config = function()
      local wk = require("which-key")

      local defaults = {
        { "<leader>b",  group = "Buffer" },
        { "<leader>c",  group = "Code" },
        { "<leader>cc", group = "Toggle Case" },
        { "<leader>hh", group = "Documentation" },
        { "<leader>f",  group = "File" },
        { "<leader>g",  group = "Git" },
        { "<leader>h",  group = "Help" },
        { "<leader>l",  group = "Tmux" },
        { "<leader>m",  group = "Language Related Commands" },
        { "<leader>o",  group = "Open" },
        { "<leader>q",  group = "Quit/Close" },
        { "<leader>r",  group = "Rails" },
        { "<leader>s",  group = "Search" },
        { "<leader>t",  group = "Test" },
        { "<leader>w",  group = "Window" },
      }

      wk.setup({
        icons = {
          mappings = false,
        }
      })
      wk.add(defaults)
    end,
  },
}

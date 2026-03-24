return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "RRethy/nvim-treesitter-endwise",
      "nvim-treesitter/nvim-treesitter-textobjects"
    },
    build = ":TSUpdate",
    event = "VeryLazy",
    config = function()
      require("nvim-treesitter").setup({
        auto_install = true,
        ensure_installed = {
          "ruby",
          "html",
          "css",
          "scss",
          "javascript",
          "typescript",
          "solidity",
          "yaml",
          "json",
          "lua",
          "vim",
          "query",
          "embedded_template",
          "bash",
          "tsx",
        },

        highlight = {
          enable = true,
        },

        indent = { enable = true, disable = { "ruby", "python" } },

        textobjects = {
          swap = {
            enable = true,
            swap_next = {
              ["g]f"] = "@function.outer",
            },
            swap_previous = {
              ["g[f"] = "@function.outer",
            },
          },
        },

        endwise = { enable = true },
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "*",
        callback = function()
          pcall(vim.treesitter.start)
        end,
      })
    end,
  },
}

return {
  {
    "ibhagwan/fzf-lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "otavioschwanck/fzf-lua-enchanted-files"
    },
    config = function(_, opts)
      local actions = require("fzf-lua.actions")
      opts.actions = {
        files = {
          ["ctrl-l"] = actions.file_sel_to_qf,
        },
      }
      require("fzf-lua").setup(vim.tbl_deep_extend("force", { "telescope" }, opts))
    end,
    opts = {
      winopts = {
        height = 0.85,
        width = 0.9,
        row = 0.35,
        border = "rounded",
        preview = {
          border = "rounded",
          horizontal = "right:50%",
          flip_columns = 160,
          winopts = {
            number = false,
          },
        },
      },
      fzf_opts = {
        ["--layout"] = "reverse",
      },
      defaults = {
        formatter = "path.dirname_first"
      },
      keymap = {
        fzf = {
          ["ctrl-q"] = "select-all+accept",
        },
      },
      files = {
        oldfiles = true,
        oldfiles_limit = 100,
      },
    },
    keys = {
      {
        "<leader><space>",
        function()
          require("fzf-lua-enchanted-files").files()
        end,
        desc = "Files",
      },
      {
        "<leader>sp",
        function()
          require("fzf-lua").live_grep()
        end,
        desc = "Live Grep",
      },
      {
        "<leader>sh",
        function()
          require("fzf-lua").help_tags()
        end,
        desc = "Help Tags",
      },
      {
        "<leader>sr",
        function()
          require("fzf-lua").oldfiles()
        end,
        desc = "Recent Files",
      },
      {
        "<leader>sw",
        function()
          require("fzf-lua").grep_cword()
        end,
        desc = "Grep word at cursor",
      },
      {
        "<leader>sw",
        function()
          require("fzf-lua").grep_visual()
        end,
        desc = "Grep region",
        mode = "v",
      },
      {
        "<leader>,",
        function()
          require("fzf-lua").buffers()
        end,
        desc = "Buffers",
      },
      {
        "<leader><cr>",
        function()
          require("fzf-lua").resume()
        end,
        desc = "Resume FZF",
      },
      {
        "<leader><tab>",
        function()
          require("fzf-lua").git_status()
        end,
        desc = "Git Status",
      },
      {
        "<leader>sd",
        function()
          require("fzf-lua").live_grep({ cwd = vim.fn.fnamemodify(vim.fn.expand("%:~:h"), ":.") })
        end,
        desc = "Live Grep On Current Folder",
      },
      {
        "<leader>ss",
        function()
          require("fzf-lua").blines({ previewer = false })
        end,
        desc = "Search on buffer",
      },
      {
        "<leader>si",
        function()
          require("fzf-lua").lsp_document_symbols()
        end,
        desc = "Document Symbols",
      },
      {
        "<leader>sI",
        function()
          require("fzf-lua").lsp_workspace_symbols()
        end,
        desc = "Project Symbols",
      },
      {
        "<leader>sW",
        function()
          require("fzf-lua").lsp_workspace_symbols({ query = vim.fn.expand("<cword>") })
        end,
        desc = "Project Symbols (word at cursor)",
      },
      {
        "<leader>so",
        function()
          require("fzf-lua").lines()
        end,
        desc = "Search on open buffers",
      },
      {
        "<leader>sD",
        function()
          require("neomood.fzf-lua-utils").live_grep_on_folder()
        end,
        desc = "Live Grep On Specific Folder",
      },
    }
  },
}

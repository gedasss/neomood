return {
  {
    "vim-test/vim-test",
    event = "VeryLazy",
    keys = {
      { "<leader>ts", "<cmd>TestNearest<cr>",                          desc = "Test nearest" },
      {
        "<leader>tf",
        function()
          if vim.fn.filereadable("/tmp/quickfix.out") then
            os.remove("/tmp/quickfix.out")
          end

          require("neomood.rspec").clear_diagnostics()
          require("neomood.rspec").wait_quickfix_to_insert_diagnostics()

          local neovim_file_path = vim.fn.stdpath("config")
          vim.cmd(
            "RSpec "
            .. "--require="
            .. neovim_file_path
            .. "/helpers/vim_formatter.rb --format VimFormatter --out /tmp/quickfix.out --format progress --only-failures"
          )
        end,
        desc = "Re-run faileds",
      },
      { "<leader>tv", "<cmd>TestFile<cr>",                             desc = "Test File" },
      {
        "<leader>tV",
        function()
          local script = vim.fn.getcwd() .. "/scripts/test.sh"
          if vim.fn.filereadable(script) == 0 then return end
          require("tmux-awesome-manager.src.term").run({
            cmd = "bash scripts/test.sh",
            name = "scripts/test.sh",
            open_as = "pane",
            visit_first_call = true,
            focus_when_call = true,
          })()
        end,
        desc = "Run scripts/test.sh",
      },
      { "<leader>tb", require("neomood.rspec").go_to_backtrace, desc = "Go to Backtrace" },
      { "<leader>ta", "<cmd>TestSuite<cr>",                            desc = "Test Suite" },
      { "<leader>tr", "<cmd>TestLast<cr>",                             desc = "Test Last" },
    },
    -- setup is on lua/config/options.lua:11
  },
}

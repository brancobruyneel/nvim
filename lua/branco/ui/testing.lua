return {
  {
    "neotest",
    load = function(name)
      vim.cmd.packadd(name)
      vim.cmd.packadd "neotest-golang"
    end,
    keys = {
      {
        "<leader>tf",
        function()
          require("neotest").run.run(vim.fn.expand "%")
        end,
        desc = "<neotest> Test current file",
      },
      {
        "<leader>tl",
        function()
          require("neotest").run.run_last()
        end,
        desc = "<neotest> Test last",
      },
      {
        "<leader>tw",
        function()
          require("neotest").watch.toggle(vim.fn.expand "%")
        end,
        desc = "<neotest> Watch current file",
      },
      {
        "<leader>tn",
        function()
          require("neotest").run.run()
        end,
        desc = "<neotest> Run close test",
      },
      {
        "<leader>ts",
        function()
          require("neotest").run.stop()
        end,
        desc = "<neotest> Stop test",
      },
      {
        "<leader>te",
        function()
          require("neotest").summary.toggle()
        end,
        desc = "<neotest> Toggle summary",
      },
      {
        "<leader>td",
        function()
          require("neotest").run.run { suite = true, strategy = "dap" }
        end,
        desc = "Debug nearest test",
      },
      {
        "<leader>to",
        function()
          require("neotest").output_panel.toggle()
        end,
        desc = "<neotest> Toggle output panel",
      },
      {
        "[t",
        function()
          require("neotest").jump.prev()
        end,
        desc = "<neotest> Jump to previous test",
      },
      {
        "]t",
        function()
          require("neotest").jump.next()
        end,
        desc = "<neotest> Jump to next test",
      },
    },
    after = function(_)
      require("neotest").setup {
        log_level = vim.log.levels.DEBUG,
        adapters = {
          require "neotest-golang" {
            go_test_args = { "-v", "-x", "-count=1", "-tags=integration" },
            go_list_args = { "-tags=integration" },
            dap_go_opts = {
              delve = {
                build_flags = { "-tags=integration" },
              },
            },
          },
        },
      }
    end,
  },
}

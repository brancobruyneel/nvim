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
        desc = "<neotest> Run closest test",
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
          require("neotest").run.run { strategy = "dap" }
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
      local adapter = require "neotest-golang" {
        runner = "gotestsum",
        testify_enabled = true,
      }

      -- Workaround: neotest-golang's return_skipped creates a context without
      -- test_output_json_filepath, which crashes results_finalize when runner
      -- is "gotestsum". Intercept and return a skipped result instead.
      local original_results = adapter.results
      adapter.results = function(spec, result, tree)
        if
          spec.context
          and not spec.context.test_output_json_filepath
          and not spec.context.is_dap_active
        then
          return {
            [spec.context.pos_id] = { status = "skipped" },
          }
        end
        return original_results(spec, result, tree)
      end

      require("neotest").setup {
        output = {
          open_on_run = false,
        },
        adapters = { adapter },
      }
    end,
  },
}

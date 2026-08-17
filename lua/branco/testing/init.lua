return {
  {
    "neotest",
    load = function(name)
      vim.cmd.packadd(name)
      vim.cmd.packadd "neotest-golang"
      vim.cmd.packadd "neotest-jest"
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
      local function has_marker(markers)
        return vim.fs.find(markers, { upward = true, path = vim.fn.getcwd(), limit = 1 })[1] ~= nil
      end

      local adapters = {}

      if has_marker { "go.mod" } then
        local golang_adapter = require "neotest-golang" {
          runner = "gotestsum",
          testify_enabled = false,
        }

        -- Workaround: neotest-golang's return_skipped creates a context without
        -- test_output_json_filepath, which crashes results_finalize when runner
        -- is "gotestsum". Intercept and return a skipped result instead.
        local original_results = golang_adapter.results
        golang_adapter.results = function(spec, result, tree)
          if spec.context and not spec.context.test_output_json_filepath and not spec.context.is_dap_active then
            return {
              [spec.context.pos_id] = { status = "skipped" },
            }
          end
          return original_results(spec, result, tree)
        end

        table.insert(adapters, golang_adapter)
      end

      if has_marker { "package.json" } then
        local jest_adapter = require "neotest-jest" {
          jestCommand = "npx jest",
          jestConfigFile = function(path)
            local root = vim.fs.root(path, { "jest.config.js", "jest.config.ts", "package.json" })
            for _, name in ipairs { "jest.config.js", "jest.config.ts", "jest.config.mjs", "jest.config.cjs" } do
              local candidate = root and (root .. "/" .. name)
              if candidate and vim.uv.fs_stat(candidate) then
                return candidate
              end
            end
            return nil
          end,
          env = { CI = "true" },
          cwd = function(path)
            return vim.fs.root(path, { "package.json" }) or vim.fn.getcwd()
          end,
        }

        table.insert(adapters, jest_adapter)
      end

      local ignored_dirs = {
        ["dist"] = true,
        ["build"] = true,
        ["node_modules"] = true,
        ["coverage"] = true,
        [".git"] = true,
        [".next"] = true,
        [".nuxt"] = true,
        [".turbo"] = true,
        ["out"] = true,
        ["vendor"] = true,
      }

      require("neotest").setup {
        output = {
          open_on_run = false,
        },
        discovery = {
          filter_dir = function(name)
            return not ignored_dirs[name]
          end,
        },
        adapters = adapters,
      }
    end,
  },
}

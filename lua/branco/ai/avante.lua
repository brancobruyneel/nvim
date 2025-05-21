return {
  {
    "avante.nvim",
    for_cat = "ai",
    load = function(name)
      require("lzextras").loaders.multi {
        name,
        "nui.nvim",
        "telescope.nvim",
        "dressing.nvim",
      }
    end,
    cmd = { "AvanteAsk", "AvanteToggle", "AvanteChat" },
    keys = {
      { "<leader>aa", "<cmd>AvanteToggle<cr>", desc = "Toggle Avante" },
    },
    after = function()
      require("avante").setup {
        provider = "itp",

        hints = {
          enabled = false,
        },

        behaviour = {
          enable_claude_text_editor_tool_mode = true,
          enable_cursor_planning_mode = true,
        },

        vendors = {
          itp = {
            __inherited_from = "openai",
            endpoint = "https://api.chatitp.inthepocket.net",
            api_key_name = "cmd:op read op://Employee/chatITP/credential",
            model = "claude-3-7-sonnet",
            max_completion_tokens = 32768,
          },
        },
      }
    end,
  },
}

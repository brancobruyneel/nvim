require("lze").load {
  "nvim-tree",
  cmd = { "NvimTreeToggle", "NvimTreeFocus" },
  before = function()
    dofile(vim.g.base46_cache .. "nvimtree")
  end,
  after = function()
    require("nvim-tree").setup {
      filters = {
        dotfiles = false,
        custom = { "^.git$" },
      },

      disable_netrw = true,
      hijack_cursor = true,
      sync_root_with_cwd = true,

      update_focused_file = {
        enable = true,
        update_root = false,
      },

      view = {
        adaptive_size = true,
        width = 30,
        preserve_window_proportions = true,
      },

      git = {
        enable = true,
      },

      actions = {
        change_dir = {
          enable = true,
          global = true,
        },
        open_file = {
          resize_window = false,
        },
      },

      renderer = {
        root_folder_label = false,
        highlight_git = true,
        indent_markers = { enable = true },
        icons = {
          show = {
            git = true,
            folder_arrow = false,
          },
          glyphs = {
            default = "󰈚",
            folder = {
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
              symlink_open = "",
            },
            git = { unmerged = "" },
          },
        },
      },
    }
  end,
}

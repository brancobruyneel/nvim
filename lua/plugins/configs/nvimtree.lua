local present, nvimtree = pcall(require, "nvim-tree")

if not present then
  return
end

local g = vim.g

nvimtree.setup {
  auto_reload_on_write = true,
  disable_netrw = true,
  hijack_cursor = true,
  hijack_netrw = true,
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = false,
  },
  renderer = {
    icons = {
      show = {
        folder = true,
        file = true,
        git = true,
      },
      glyphs = {
        default = "",
        symlink = "",
        git = {
          deleted = "",
          ignored = "◌",
          renamed = "➜",
          staged = "✓",
          unmerged = "",
          unstaged = "✗",
          untracked = "★",
        },
        folder = {
          default = "",
          empty = "",
          empty_open = "",
          open = "",
          symlink = "",
          symlink_open = "",
        },
      },
    },
  },
  view = {
    hide_root_folder = true,
    side = "left",
    width = 25,
    preserve_window_proportions = true,
  },
  actions = {
    change_dir = {
      enable = true,
      global = true,
      restrict_above_cwd = false,
    },
  },
  filters = {
    custom = { ".git" },
    exclude = { ".gitignore", ".gitlab", ".github" },
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
}

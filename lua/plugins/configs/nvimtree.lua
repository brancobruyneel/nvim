local present, nvimtree = pcall(require, "nvim-tree")

if not present then
  return
end

local g = vim.g

g.nvim_tree_show_icons = {
  folders = 1,
  files = 1,
  git = 1,
}

g.nvim_tree_icons = {
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
}

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
    exclude = { ".gitignore", ".gitlab" },
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
}

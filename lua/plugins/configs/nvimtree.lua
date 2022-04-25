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
  disable_netrw = true,
  hide_root_folder = true,
  hijack_cursor = true,
  hijack_netrw = true,
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = false,
  },
  view = {
    side = "left",
    width = 25,
    preserve_window_proportions = true,
  },
  filters = {
    custom = { ".git" },
    exclude = { ".gitignore" },
  },
}

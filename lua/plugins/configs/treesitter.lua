local present, ts_config = pcall(require, "nvim-treesitter.configs")
if not present then
  return
end

ts_config.setup {
  ensure_installed = {
    "lua",
    "vim",
    "regex",
    "bash",
    "html",
    "css",
    "javascript",
    "typescript",
    "rust",
    "c",
    "c_sharp",
    "python",
  },

  highlight = {
    enable = true,
    use_languagetree = true,
  },
  indent = {
    enable = true,
  },
}

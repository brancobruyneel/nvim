local present, ts_config = pcall(require, "nvim-treesitter.configs")
if not present then
  return
end

local parsers = require("nvim-treesitter.parsers").get_parser_configs()

parsers.gotmpl = {
  install_info = {
    url = "https://github.com/ngalaiko/tree-sitter-go-template",
    files = { "src/parser.c" },
  },
  filetype = "gotmpl",
  used_by = {
    "gohtmltmpl",
    "gotexttmpl",
    "gotmpl",
    "goyamltmpl",
    -- "yaml",
    "ctmpl",
  },
}

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
  context_commentstring = {
    enable = true,
    config = {
      yaml = "# %s",
      gotmpl = "{{- /* %s */}}",
    },
  },
}

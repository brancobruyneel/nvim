# Neovim Configuration

Personal Neovim configuration built with **NixCats** for declarative, reproducible plugin and tooling management via Nix flakes.

## Architecture

```
flake.nix              # Nix flake entry point, exports nixosModule/homeModule/overlays
cats/
  default.nix          # Wires categories + packages into NixCats definitions
  categories.nix       # Plugin/dependency declarations (startup, optional, LSP/runtime deps)
  packages.nix         # Package definitions with category enable flags
init.lua               # Entry point: loads base46 theme cache, then requires branco/
lua/
  chadrc.lua           # NvChad theme config (base46/nvchad-ui)
  branco/
    init.lua            # Bootstraps options, keymaps, autocmds, and lazy-loads all modules via lze
    options.lua         # Core vim options
    keymaps.lua         # Global key mappings
    autocmds.lua        # Autocommands
    completions/        # blink.cmp completion setup
    lsp/                # LSP, formatters, linters, treesitter
      config.lua        # Shared LSP attach config and diagnostics
      formatters.lua    # conform.nvim formatter config
      linters.lua       # nvim-lint linter config
      treesitter.lua    # Treesitter + treesitter-context
      servers/          # Per-language LSP server configs
    git/                # Git integrations (neogit, diffview, gitsigns, git-worktree)
    testing/            # Neotest with neotest-golang adapter
    debug/              # DAP debugging (nvim-dap, nvim-dap-go, nvim-dap-ui)
    ai/                 # Avante.nvim AI assistant
    ui/                 # UI plugins (telescope, nvim-tree, nvchad-ui, render-markdown)
    misc/               # Miscellaneous (mini.surround)
```

## Build

- **Framework**: NixCats (`github:BirdeeHub/nixCats-nvim`), not nixvim or home-manager native neovim
- **Build**: `nix build` produces the Neovim package; typically consumed via `homeModule`
- **Format Nix**: `nix fmt` uses `nixfmt-tree` with `--strict`
- **Critical**: Always `git add .` before rebuilding; Nix flakes cannot see unstaged files

## How to Add a Plugin

1. Add the plugin derivation to `cats/categories.nix` (`startupPlugins` or `optionalPlugins`)
2. Ensure its category is enabled in `cats/packages.nix`
3. `git add .` (required for flake visibility)
4. Write Lua config with an lze spec in the appropriate module under `lua/branco/`

## How to Add a Runtime Tool (LSP, formatter, linter)

1. Add to `lspsAndRuntimeDeps` in `cats/categories.nix`
2. Configure in the corresponding Lua module (e.g. `lua/branco/lsp/servers/` for LSP, `formatters.lua`, `linters.lua`)

## Working with Plugins

When adding, configuring, or modifying a plugin, always fetch its README from GitHub first (e.g. `https://raw.githubusercontent.com/{owner}/{repo}/main/README.md`). If the README lacks detail, read the plugin's source code directly from GitHub for the actual setup() options, config keys, and module structure. Plugin APIs change frequently; do not rely on training data which may be outdated.

## Conventions

- Lua config lives under `lua/branco/`, one directory per concern
- Each module has an `init.lua` that registers lazy-load handlers with `lze`
- LSP servers each get their own file under `lua/branco/lsp/servers/`
- Plugin options are configured inline in their module files, not in separate config files
- All runtime dependencies (LSP servers, formatters, linters) are Nix-managed in `cats/categories.nix`
- Nix handles plugin installation; Lua handles all Neovim configuration. No Lua-in-Nix-strings

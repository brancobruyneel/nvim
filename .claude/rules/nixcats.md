---
paths:
  - "cats/**/*.nix"
  - "lua/**/*.lua"
  - "flake.nix"
---

# NixCats Reference

NixCats (`github:BirdeeHub/nixCats-nvim`): "Install with Nix, configure with Lua."

## Categories in `cats/categories.nix`

- `startupPlugins`: loaded automatically at startup
- `optionalPlugins`: available via `packadd`, lazy-loaded by lze
- `lspsAndRuntimeDeps`: binaries added to PATH (LSP servers, formatters, linters)
- `environmentVariables`, `sharedLibraries`, `extraWrapperArgs`: runtime environment

Categories are enabled/disabled per package in `cats/packages.nix`. Nested subcategories (e.g. `lang.go = true`) enable only that subset.

## Checking Categories from Lua

```lua
nixCats('general')      -- returns truthy if category enabled, nil if not
nixCats('lang.go')      -- nested categories use dot notation
```

Other useful fields:
- `nixCats.cats` - all enabled categories
- `nixCats.settings` - package settings from Nix
- `nixCats.configDir` - path to config directory

Use `:NixCats pawsible` in Neovim to see exact plugin names for `packadd`.

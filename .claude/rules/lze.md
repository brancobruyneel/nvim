---
paths:
  - "lua/**/*.lua"
---

# lze Reference

lze (`github:BirdeeHub/lze`) is a lazy-loading library (not a plugin manager). It defers `packadd` calls until a trigger fires. `lzextras` provides additional handlers.

## Spec Format

```lua
require("lze").load {
    {
        "plugin-name",              -- [1] = plugin name (must match packadd name)
        event = "BufEnter",         -- trigger: autocmd event
        after = function(plugin)    -- runs after plugin loads (call setup() here)
            require("plugin").setup({})
        end,
    },
}
```

## Available Triggers

| Field | Description |
|---|---|
| `event` | Autocmd event (e.g. `"InsertEnter"`, `"DeferredUIEnter"` = lazy.nvim's `VeryLazy`) |
| `cmd` | User command (e.g. `"Telescope"`) |
| `ft` | Filetype (e.g. `"go"`) |
| `keys` | Keypress (e.g. `{ "<leader>ff", "<CMD>Telescope find_files<CR>", desc = "..." }`) |
| `colorscheme` | Colorscheme name |
| `dep_of` | Load before another plugin |
| `on_plugin` | Load after another plugin |
| `on_require` | Load when a Lua module is `require`d |

## Loading Hooks (execution order)

`beforeAll` -> `before` -> `load` (default: `vim.cmd.packadd`) -> `after`

`load()` can be called multiple times from different files.

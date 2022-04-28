local M = {}

local cmd = vim.cmd

M.close_buffer = function(force)
  if force or not vim.bo.buflisted or vim.bo.buftype == "nofile" then
    cmd ":bd!"
  else
    cmd "bd"
  end
end

M.map = function(mode, keys, cmd, opt)
  local options = { noremap = true, silent = true }
  if opt then
    options = vim.tbl_extend("force", options, opt)
  end

  -- all valid modes allowed for mappings
  -- :h map-modes
  local valid_modes = {
    [""] = true,
    ["n"] = true,
    ["v"] = true,
    ["s"] = true,
    ["x"] = true,
    ["o"] = true,
    ["!"] = true,
    ["i"] = true,
    ["l"] = true,
    ["c"] = true,
    ["t"] = true,
  }

  -- helper function for M.map
  -- can gives multiple modes and keys
  local function map_wrapper(mode, lhs, rhs, options)
    if type(lhs) == "table" then
      for _, key in ipairs(lhs) do
        map_wrapper(mode, key, rhs, options)
      end
    else
      if type(mode) == "table" then
        for _, m in ipairs(mode) do
          map_wrapper(m, lhs, rhs, options)
        end
      else
        if valid_modes[mode] and lhs and rhs then
          vim.api.nvim_set_keymap(mode, lhs, rhs, options)
        else
          mode, lhs, rhs = mode or "", lhs or "", rhs or ""
          print("Cannot set mapping [ mode = '" .. mode .. "' | key = '" .. lhs .. "' | cmd = '" .. rhs .. "' ]")
        end
      end
    end
  end

  map_wrapper(mode, keys, cmd, options)
end

-- load plugin after entering vim ui
M.packer_lazy_load = function(plugin, timer)
  if plugin then
    timer = timer or 0
    vim.defer_fn(function()
      require("packer").loader(plugin)
    end, timer)
  end
end

-- Highlights functions

-- Define bg color
-- @param group Group
-- @param color Color

M.bg = function(group, col)
  cmd("hi " .. group .. " guibg=" .. col)
end

-- Define fg color
-- @param group Group
-- @param color Color
M.fg = function(group, col)
  cmd("hi " .. group .. " guifg=" .. col)
end

-- Define bg and fg color
-- @param group Group
-- @param fgcol Fg Color
-- @param bgcol Bg Color
M.fg_bg = function(group, fgcol, bgcol)
  cmd("hi " .. group .. " guifg=" .. fgcol .. " guibg=" .. bgcol)
end

return M

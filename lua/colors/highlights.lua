local cmd = vim.cmd

local global_theme = "colors/themes/onedark"
local colors = require(global_theme)

local white = colors.white
local darker_black = colors.darker_black
local black = colors.black
local black2 = colors.black2
local one_bg = colors.one_bg
local one_bg2 = colors.one_bg2
local one_bg3 = colors.one_bg3
local light_grey = colors.light_grey
local grey = colors.grey
local grey_fg = colors.grey_fg
local red = colors.red
local line = colors.line
local green = colors.green
local nord_blue = colors.nord_blue
local blue = colors.blue
local yellow = colors.yellow
local purple = colors.purple

local fg = require("core.utils").fg
local fg_bg = require("core.utils").fg_bg
local bg = require("core.utils").bg

bg("Normal", "NONE")
bg("Folded", "NONE")
fg("Folded", "NONE")
fg("Comment", grey)

-- blankline

fg("IndentBlanklineChar", line)

-- misc --
fg("LineNr", grey)
fg("Comment", grey)
fg("NvimInternalError", red)
fg("VertSplit", line)
fg("EndOfBuffer", black)

-- Pmenu
bg("Pmenu", one_bg)
bg("PmenuSbar", one_bg2)
bg("PmenuSel", green)
bg("PmenuThumb", nord_blue)

-- inactive statuslines as thin splitlines
cmd("hi! StatusLineNC gui=underline guifg=" .. line)

-- line n.o
cmd "hi clear CursorLine"
fg("cursorlinenr", white)

-- NvimTree
fg("NvimTreeFolderIcon", blue)
fg("NvimTreeFolderName", blue)
fg("NvimTreeOpenedFolderName", blue)
fg("NvimTreeEmptyFolderName", blue)
fg("NvimTreeIndentMarker", one_bg2)
-- fg("NvimTreeVertSplit", darker_black)
-- bg("NvimTreeVertSplit", darker_black)

-- fg("NvimTreeRootFolder", darker_black)
-- bg("NvimTreeNormal", darker_black)
-- fg_bg("NvimTreeStatuslineNc", darker_black, darker_black)

-- telescope
fg("TelescopeBorder", grey)
fg("TelescopePromptBorder", grey)
fg("TelescopeResultsBorder", grey)
fg("TelescopePreviewBorder", grey)

-- LspDiagnostics ---

-- error / warnings
fg("LspDiagnosticsSignError", red)
fg("LspDiagnosticsVirtualTextError", red)
fg("LspDiagnosticsSignWarning", yellow)
fg("LspDiagnosticsVirtualTextWarning", yellow)

-- info
fg("LspDiagnosticsSignInformation", green)
fg("LspDiagnosticsVirtualTextInformation", green)

-- hint
fg("LspDiagnosticsSignHint", purple)
fg("LspDiagnosticsVirtualTextHint", purple)

-- Git signs
fg_bg("DiffAdd", green, "NONE")
fg_bg("DiffChange", grey_fg, "NONE")
fg_bg("DiffChangeDelete", red, "NONE")
fg_bg("DiffModified", red, "NONE")
fg_bg("DiffDelete", red, "NONE")

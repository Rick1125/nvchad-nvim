---@diagnostic disable: inject-field
-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@diagnostic disable-next-line: undefined-doc-name
---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "everblush",
  theme_toggle = { "everblush", "one_light" },

  hl_add = {
    NvimTreeOpenedFolderName = { fg = "green", bold = true },
  },
  statusline = {
    theme = "default", -- default/vscode/vscode_colored/minimal
    -- theme = "vscode_colored", -- default/vscode/vscode_colored/minimal
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    separator_style = "round",
  },

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
}

return M

require "nvchad.options"

-- add yours here!

local g = vim.g
local o = vim.o

local autocmd = vim.api.nvim_create_autocmd
-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})

o.cursorlineopt = "both" -- to enable cursorline!

-- change guifont
o.guifont = "Pragmasevka Nerd Font:h18"
-- o.guifont = "CaskaydiaCove Nerd Font:h18"
-- o.guifont = "CodeNewRoman Nerd Font:h18"
-- o.guifont = "MonoLisa Nerd Font:h18"

o.relativenumber = true
o.number = true

o.pumblend = 10 -- Popup menu transparency
o.pumheight = 8 -- Popup menu height

-- neovide
g.neovide_fullscreen = true
g.neovide_transparency = 0.9          -- didn't work when gui fullscreen
g.neovide_line_height = 120           -- didn't work at all
g.neovide_remember_window_size = true
g.neovide_cursor_vfx_mode = "torpedo" -- options: pixiedust, sonicboom, ripple, wireframe, railgun

-- vscode format i.e json files
g.vscode_snippets_path = "~/.config/nvim/snippets"

-- snipmate format
-- g.snipmate_snippets_path = "~/.config/nvim/snippets"

-- format
-- g.lua_snippets_path = vim.fn.stdpath "config" .. "/lua/custom/lua_snippets"

-- g.codeium_enabled = false
-- g.codeium_no_map_tab = true

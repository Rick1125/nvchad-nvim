require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

-- change guifont
vim.opt.guifont = "Pragmasevka Nerd Font:h18"
-- vim.opt.guifont = "CaskaydiaCove Nerd Font:h18"
-- vim.opt.guifont = "CodeNewRoman Nerd Font:h18"
-- vim.opt.guifont = "MonoLisa Nerd Font:h18"

vim.opt.relativenumber = true
vim.opt.number = true

vim.opt.pumblend = 10 -- Popup menu transparency
vim.opt.pumheight = 8 -- Popup menu height

-- neovide
vim.g.neovide_fullscreen = true
vim.g.neovide_transparency = 0.9          -- didn't work when gui fullscreen
vim.g.neovide_line_height = 120           -- didn't work at all
vim.g.neovide_remember_window_size = true
vim.g.neovide_cursor_vfx_mode = "torpedo" -- options: pixiedust, sonicboom, ripple, wireframe, railgun

-- vscode format i.e json files
vim.g.vscode_snippets_path = "~/.config/nvim/snippets"

-- snipmate format
-- vim.g.snipmate_snippets_path = "~/.config/nvim/snippets"

-- lua format
-- vim.g.lua_snippets_path = vim.fn.stdpath "config" .. "/lua/custom/lua_snippets"

-- vim.g.codeium_enabled = false
-- vim.g.codeium_no_map_tab = true

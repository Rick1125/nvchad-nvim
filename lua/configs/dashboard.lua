return function()
  local opts = {
    config = {
      week_header = {
        enable = true, --boolean use a week header
      },
      shortcut = {
        -- action can be a function type
        -- { desc = string, group = "highlight group", key = "shortcut key", action = "action when you press key" },
        { desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
        {
          icon = " ",
          icon_hl = "@variable",
          desc = "Files",
          group = "Label",
          action = "Telescope find_files",
          key = "f",
        },
        {
          desc = " Old files",
          group = "DiagnosticHint",
          action = "Telescope oldfiles",
          key = "o",
        },
        {
          desc = " New file",
          group = "Number",
          action = "ene | startinsert",
          key = "n",
        },
      },
      packages = { enable = true }, -- show how many plugins neovim loaded
      -- limit how many projects list, action when you press key or enter it will run this action.
      -- action can be a functino type, e.g.
      -- action = func(path) vim.cmd('Telescope find_files cwd=' .. path) end
      -- project = { enable = true, limit = 8, icon = "your icon", label = "", action = "Telescope find_files cwd=" },
      -- mru = { limit = 10, icon = "your icon", label = "", cwd_only = false },
    },
  }

  -- close Lazy and re-open when the dashboard is ready
  if vim.o.filetype == "lazy" then
    vim.cmd.close()
    vim.api.nvim_create_autocmd("User", {
      pattern = "DashboardLoaded",
      callback = function()
        require("lazy").show()
      end,
    })
  end

  return opts
end

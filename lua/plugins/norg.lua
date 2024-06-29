local plugins = {
  -- norg
  {
    "rebelot/kanagawa.nvim", -- neorg needs a colorscheme with treesitter support
    config = function()
      vim.cmd.colorscheme "kanagawa"
    end,
  },
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
  },
  {
    "nvim-neorg/neorg",
    ft = "norg",
    event = "VeryLazy",
    version = "*",
    -- build = function()
    --   vim.cmd [[silent! Neorg sync-parsers]]
    -- end,
    keys = {
      { "<leader>ng", "<cmd>Neorg<cr>", desc = "Neorg note" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "luarocks.nvim",
    },
    config = function()
      require "configs.neorg"
    end,
  },
}

return plugins

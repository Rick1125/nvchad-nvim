local overrides = require "configs.overrides"

---@type NvPluginSpec[]
return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- nice, noise, notice plugin
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
      lsp = {
        hover = {
          enabled = false,
        },
        signature = {
          enabled = false,
        },
      },
      presets = {
        long_message_to_split = true, -- long messages will be sent to a split
        -- inc_rename = false,           -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false,       -- add a border to hover docs and signature help
      },
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
  },

  --- misc plugins ---
  ---
  -- Dashboard
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = require "configs.dashboard",
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
  },

  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "voldikss/vim-floaterm",
    event = "VeryLazy",
  },

  {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end,
  },

  -- Override plugin definition options
  {
    "ellisonleao/glow.nvim",
    config = true,
    cmd = "Glow",
  },

  { "emakman/nvim-latex-previewer" },

  {
    "ur4ltz/surround.nvim",
    config = function(_, opts)
      require("surround").setup(opts)
    end,
    opts = {
      mappings_style = "surround",
    },
    event = "VeryLazy",
  },

  {
    "wakatime/vim-wakatime",
    event = "VeryLazy",
  },

  {
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup {
        window = {
          blend = 0,
        },
      }
    end,
  },
}

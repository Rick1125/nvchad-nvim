---@type NvPluginSpec[]
return {
  {
    "mireq/luasnip-snippets",
    dependencies = { "L3MON4D3/LuaSnip" },
    init = function()
      -- Mandatory setup function
      require("luasnip_snippets.common.snip_utils").setup()
    end,
  },

  { "saadparwaiz1/cmp_luasnip" },

  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
    -- enabled = false
  },

  {
    "onsails/lspkind.nvim",
    config = function()
      require("lspkind").init {
        mode = "symbol_text",
        preset = "codicons",
        symbol_map = {
          Text = "󰉿",
          Method = "󰆧",
          Function = "󰊕",
          Constructor = "",
          Field = "󰜢",
          Variable = "󰀫",
          Class = "󰠱",
          Interface = "",
          Module = "",
          Property = "󰜢",
          Unit = "󰑭",
          Value = "󰎠",
          Enum = "",
          Keyword = "󰌋",
          Snippet = "",
          Color = "󰏘",
          File = "󰈙",
          Reference = "󰈇",
          Folder = "󰉋",
          EnumMember = "",
          Constant = "󰏿",
          Struct = "󰙅",
          Event = "",
          Operator = "󰆕",
          TypeParameter = "",
        },
      }
    end,
  },

  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- nice, noise, notice plugin
  -- https://github.com/folke/noice.nvim
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>nl", "<cmd>Noice last<cr>", desc = "Noice last" },
      { "<leader>nd", "<cmd>NoiceDisable<cr>", desc = "Disable Noice" },
      { "<leader>ne", "<cmd>NoiceEnable<cr>", desc = "Enable Noice" },
    },
    opts = {
      -- add any options here
      lsp = {
        hover = {
          enabled = false,
        },
        signature = {
          enabled = false,
        },
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
      },
      presets = {
        long_message_to_split = true, -- long messages will be sent to a split
        -- inc_rename = false,           -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
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

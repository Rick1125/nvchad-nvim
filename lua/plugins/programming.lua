local overrides = require "configs.overrides"
local plugins = {
  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        ft = "go",
        config = function()
          require "configs.null-ls"
        end,
      },
    },
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  --
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    keys = {
      {
        "[c",
        function()
          require("treesitter-context").go_to_context()
        end,
        desc = "Jump to context",
      },
    },
    opts = overrides.treesitter,
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = "nvim-treesitter/nvim-treesitter",
    lazy = false,
  },

  {
    "dreamsofcode-io/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("dap-go").setup(opts)
    end,
  },

  {
    "mfussenegger/nvim-dap",
  },

  -- golang
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
    end,
    keys = {
      { "<leader>tj", "<cmd>GoTagAdd json<cr>", desc = "Gopher add json tag to structure" },
      { "<leader>ty", "<cmd>GoTagAdd yaml<cr>", desc = "Gopher add yaml tag to structure" },
    },
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },

  {
    "crusj/structrue-go.nvim",
    ft = "go",
    branch = "main",
    config = function()
      require("structrue-go").setup()
    end,
    event = "BufEnter",
  },
}

return plugins

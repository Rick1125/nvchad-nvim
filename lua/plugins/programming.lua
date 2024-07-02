local overrides = require "configs.overrides"
local plugins = {
  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        -- "jose-elias-alvarez/null-ls.nvim",
        "nvimtools/none-ls.nvim",
        dependencies = {
          "nvimtools/none-ls-extras.nvim",
        },
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
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup {
        ensure_installed = {
          "html",
          "lua_ls",
          "cssls",
          "biome",
          "unocss",
          "svelte",
          "ruff_lsp",
          "gopls",
        },
      }
    end,
  },

  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    ft = { "c", "cpp", "lua", "php", "py", "js", "svelte", "rust", "go" },
    config = function()
      require("lspsaga").setup {}
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter", -- optional
      "nvim-tree/nvim-web-devicons", -- optional
    },
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
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      local dap, dapui = require "dap", require "dapui"
      dapui.setup()
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end,
  },

  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    config = function()
      require "configs.dapconfig"
    end,
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

  -- code completion
  {
    "hrsh7th/nvim-cmp",
    opts = overrides.cmp,
  },
}

return plugins

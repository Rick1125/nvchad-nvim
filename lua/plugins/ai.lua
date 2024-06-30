local chat = {
  api_host_cmd = "echo one.onerise.tech",
  api_key_cmd = "pass Ai/OpenAI/API-KEY",
  openai_params = {
    model = "gpt-4o",
  },
  openai_edit_params = {
    model = "gpt-4o",
  },
}

local plugins = {
  -- CHATGPT
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup(chat)
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },

  {
    "Exafunction/codeium.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("codeium").setup {}
    end,
    event = "BufEnter",
  },

  {
    "David-Kunz/gen.nvim",
    keys = {
      { "<leader>gg", "<cmd>Gen Generate<cr>", mode = "n", { nowait = true } },
      { "<leader>ga", "<cmd>Gen Ask<cr>",      mode = "n", { nowait = true } },
    },
    config = function()
      require("gen").setup {
        display_mode = "split",
        show_prompt = true,
        model = "gemma2",
        no_auto_close = true,
      }
    end,
    event = "BufEnter",
  },
}

return plugins

local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "svelte",
    "tsx",
    "markdown",
    "markdown_inline",
    "go",
    "gowork",
    "python",
    "php",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "emmet-language-server",
    "prettier",
    "php",
    "svelte",

    -- golang
    "gopls",

    -- machine learning
    "python",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },
  view = {
    side = "right",
  },
  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.cmp = {
  sources = {
    { name = "nvim_lsp" },
    { name = "codeium" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
  },
  formatting = {
    format = require("lspkind").cmp_format {
      mode = "symbol_text",
      maxwidth = 50,
      ellipsis_char = "...",
      symbol_map = { Codeium = "" },
    },
  },
}

return M

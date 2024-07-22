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
    "biome",
    "html-lsp",
    "typescript-language-server",
    "js-debug-adapter",
    "emmet-language-server",
    "prettier",
    "php",
    "svelte",

    -- golang
    "gopls",

    -- machine learning
    "python",
    "ruff-lsp",
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
  experimental = {
    ghost_text = {
      hl_group = "LspCodeLens",
    },
  },
  formatting = {
    format = require("lspkind").cmp_format {
      mode = "symbol_text",
      ellipsis_char = "...",
      symbol_map = { Codeium = "" },
    },
  },
}

M.luasnip = {
  load_ft_func = require("luasnip_snippets.common.snip_utils").load_ft_func,
  ft_func = require("luasnip_snippets.common.snip_utils").ft_func,
  -- To enable auto expansin
  enable_autosnippets = true,
  -- Uncomment to enable visual snippets triggered using <c-x>
  -- store_selection_keys = '<c-x>'
}

return M

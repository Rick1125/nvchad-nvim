-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "lua_ls", "biome", "cssls", "unocss", "svelte", "ruff_lsp", "gopls" }

local function organize_imports()
  local params = {
    command = "_typescript.organize_imports",
    arguments = { vim.api.nvim_buf_get_name(0) },
  }
  vim.lsp.buf.execute_command(params)
end

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

lspconfig.tsserver.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  init_options = {
    preferences = {
      disableSuggestions = true,
    },
  },
  commands = {
    OrganizeImports = { organize_imports, description = "Organize Imports" },
  },
}

lspconfig.emmet_language_server.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  filetypes = {
    "html",
    "svelte",
    "css",
    "scss",
    "javascript",
    "typescriptreact",
    "typescript.tsx",
    "javascriptreact",
    "javascript.jsx",
    "vue",
  },
}

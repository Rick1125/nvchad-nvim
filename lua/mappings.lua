require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- general
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<C-c>", "<ESC>", { desc = "escape input", nowait = true })
map("n", "J", "mzJ`z", { desc = "join lines", nowait = true })
map("n", "<CR>", '{->v:hlsearch ? ":nohl\\<CR>" : "\\<CR>"}()', { desc = "no highlight", expr = true })
map("n", "<leader>ls", "<cmd>Lazy sync<cr>", { desc = "layzy sync", nowait = true })
map("n", "<leader>tm", "<cmd>FloatermToggle<cr>", { desc = "float terminal", nowait = true })
map("n", "<leader>of", "<cmd>Oil --float<cr>", { desc = "Open parent directory", nowait = true })
map("n", "<M-,>", "<cmd>Neotree float reveal git_status<cr>", { desc = "Open NeoTree", nowait = true })
map("n", "<M-;>", "<cmd>Neotree reveal<cr>", { desc = "Open NeoTree right side", nowait = true })

map("t", "<C-d>", vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), { desc = "Escape terminal mode" })

-- move cursor
map("n", "<C-j>", "<cmd>m .+1<cr>==", { desc = "move cursor one line down", nowait = true })
map("n", "<C-k>", "<cmd>m .-2<cr>==", { desc = "move cursor one line up", nowait = true })

map("v", "<C-j>", "<cmd>m '>+1<cr>==gv=gv", { desc = "move cursor one line down", nowait = true })
map("v", "<C-k>", "<cmd>m '<-2<cr>==gv=gv", { desc = "move cursor one line up", nowait = true })

-- hop
map("n", "<leader><leader>l", "<cmd>HopLine<CR>", { desc = "Hop to line", nowait = true })
map("n", "<leader><leader>w", "<cmd>HopWord<CR>", { desc = "Hop to word", nowait = true })
map("n", "<leader><leader>f", "<cmd>HopChar1<CR>", { desc = "Hop to char1", nowait = true })
map("n", "<leader><leader>F", "<cmd>HopChar2<CR>", { desc = "Hop to char2", nowait = true })

-- dap
map("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>", { desc = "Toggle breakpoint at line", nowait = true })
map("n", "<leader>dc", "<cmd>DapContinue<CR>", { desc = "Continue", nowait = true })
map("n", "<leader>di", "<cmd>DapStepInto<CR>", { desc = "Step into", nowait = true })
map("n", "<leader>do", "<cmd>DapStepOver<CR>", { desc = "Step over", nowait = true })
map("n", "<leader>dO", "<cmd>DapStepOut<CR>", { desc = "Step out", nowait = true })
map("n", "<leader>dS", "<cmd>DapRunToCursor<CR>", { desc = "Run to cursor", nowait = true })
map("n", "<leader>dt", "<cmd>DapTerminate<CR>", { desc = "Terminate", nowait = true })
map("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<CR>", { desc = "Toggle UI", nowait = true })
map("n", "<leader>dus", function()
  local widgets = require "dap.ui.widgets"
  local sidebar = widgets.sidebar(widgets.scopes)
  sidebar.open()
end, { desc = "Open sidebar", nowait = true })
map("n", "<leader>dgt", function()
  require("dap-go").debug_test()
end, { desc = "Debug test", nowait = true })
map("n", "<leader>dgl", function()
  require("dap-go").debug_last()
end, { desc = "Debug last go test", nowait = true })

-- gopher
-- map("n", "<leader>tj", "<cmd>GoTagAdd json<cr>", { desc = "Gopher add json tag to structure", nowait = true })
-- map("n", "<leader>ty", "<cmd>GoTagAdd yaml<cr>", { desc = "Gopher add yaml tag to structure", nowait = true })

-- ai
map("n", "<leader>ai", "<cmd>ChatGPT<cr>", { desc = "ChatGPT", nowait = true })
map("n", "<leader>ae", "<cmd>ChatGPTEditWithInstructions<cr>", { desc = "Edit with instructions", nowait = true })
map("n", "<leader>at", "<cmd>ChatGPTRun translate<cr>", { desc = "Translate", nowait = true })
map(
  "n",
  "<leader>cl",
  "<cmd>ChatGPTRun code_readability_analysis<cr>",
  { desc = "Code Readability Analysis", nowait = true }
)
map("n", "<leader>cx", "<cmd>ChatGPTRun explain_code<cr>", { desc = "Explain code", nowait = true })

-- neorg
-- map("n", "<leader>ng", "<cmd>Neorg<cr>", { desc = "Norg note", nowait = true })

-- treesitter context
-- map("n", "[c", function()
--   require("treesitter-context").go_to_context()
-- end, { desc = "jump to context", nowait = true })

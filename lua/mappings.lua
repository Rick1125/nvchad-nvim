require "nvchad.mappings"
local wk = require "which-key"

-- add yours here

local map = vim.keymap.set

-- general
map({ "n", "v" }, ";", ":", { desc = "CMD enter command mode" })
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

-- lspsaga
wk.register({
  s = {
    name = "LspSaga",
    a = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
    l = { "<cmd>Lspsaga show_line_diagnostics<cr>", "Show Line Diagnostics" },
    g = { "<cmd>Lspsaga goto_definition<cr>", "Goto Definition" },
    D = { "<cmd>Lspsaga hover_doc<cr>", "Hover Document" },
    d = { "<cmd>Lspsaga peek_definition<cr>", "Peek Definition" },
    r = { "<cmd>Lspsaga rename<cr>", "Rename Variable" },
    n = { "<cmd>Lspsaga diagnostic_jump_next<cr>", "Diagnostic Jump Next" },
    p = { "<cmd>Lspsaga diagnostic_jump_prev<cr>", "Diagnostic Jump Prev" },
  },
}, { prefix = "<leader>" })

-- dap
wk.register({
  d = {
    name = "DAP",
    b = { "<cmd>DapToggleBreakpoint<CR>", "Toggle breakpoint at line" },
    c = { "<cmd>DapContinue", "Continue" },
    i = { "<cmd>DapStepInto<CR>", "Step into" },
    o = { "<cmd>DapStepOver<CR>", "Step over" },
    O = { "<cmd>DapStepOut<CR>", "Step out" },
    S = { "<cmd>DapRunToCursor<CR>", "Run to cursor" },
    t = { "<cmd>DapTerminate<CR>", "Terminate" },
    u = { "<cmd>lua require'dapui'.toggle()<CR>", "Toggle UI" },
    us = {
      function()
        local widgets = require "dap.ui.widgets"
        local sidebar = widgets.sidebar(widgets.scopes)
        sidebar.open()
      end,
      "Open sidebar",
    },
    gt = {
      function()
        require("dap-go").debug_test()
      end,
      "Debug test",
    },
    gl = {
      function()
        require("dap-go").debug_last()
      end,
      "Debug last go test",
    },
  },
}, { prefix = "<leader>" })

-- ai
wk.register({
  c = {
    name = "AI",
    i = { "<cmd>ChatGPT<cr>", "ChatGPT" },
    l = { "<cmd>ChatGPTActAs<cr>", "ChatGPT Act as" },
    c = { "<cmd>ChatGPTRun optimize_code<cr>", "Optimize code" },
    o = { "<cmd>ChatGPTRun translate<cr>", "Translate" },
    t = { "<cmd>ChatGPTRun code_readability_analysis<cr>", "Code Readability Analysis" },
    x = { "<cmd>ChatGPTRun explain_code<cr>", "Explain code" },
  },
}, { prefix = "<leader>" })

-- neorg
-- map("n", "<leader>ng", "<cmd>Neorg<cr>", { desc = "Norg note", nowait = true })

-- treesitter context
-- map("n", "[c", function()
--   require("treesitter-context").go_to_context()
-- end, { desc = "jump to context", nowait = true })

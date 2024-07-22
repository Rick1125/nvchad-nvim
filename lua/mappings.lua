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
wk.add {
  { "<leader>s", group = "LspSaga" },
  { "<leader>sD", "<cmd>Lspsaga hover_doc<cr>", desc = "Hover Document" },
  { "<leader>sa", "<cmd>Lspsaga code_action<cr>", desc = "Code Action" },
  { "<leader>sd", "<cmd>Lspsaga peek_definition<cr>", desc = "Peek Definition" },
  { "<leader>sg", "<cmd>Lspsaga goto_definition<cr>", desc = "Goto Definition" },
  { "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<cr>", desc = "Show Line Diagnostics" },
  { "<leader>sn", "<cmd>Lspsaga diagnostic_jump_next<cr>", desc = "Diagnostic Jump Next" },
  { "<leader>sp", "<cmd>Lspsaga diagnostic_jump_prev<cr>", desc = "Diagnostic Jump Prev" },
  { "<leader>sr", "<cmd>Lspsaga rename<cr>", desc = "Rename Variable" },
}

-- dap
wk.add {
  { "<leader>d", group = "DAP" },
  { "<leader>dO", "<cmd>DapStepOut<CR>", desc = "Step out" },
  { "<leader>dS", "<cmd>DapRunToCursor<CR>", desc = "Run to cursor" },
  { "<leader>db", "<cmd>DapToggleBreakpoint<CR>", desc = "Toggle breakpoint at line" },
  { "<leader>dc", "<cmd>DapContinue", desc = "Continue" },
  {
    "<leader>dgl",
    function()
      require("dap-go").debug_last()
    end,
    desc = "Debug last go test",
  },
  {
    "<leader>dgt",
    function()
      require("dap-go").debug_test()
    end,
    desc = "Debug test",
  },
  { "<leader>di", "<cmd>DapStepInto<CR>", desc = "Step into" },
  { "<leader>do", "<cmd>DapStepOver<CR>", desc = "Step over" },
  { "<leader>dt", "<cmd>DapTerminate<CR>", desc = "Terminate" },
  { "<leader>du", "<cmd>lua require'dapui'.toggle()<CR>", desc = "Toggle UI" },
  {
    "<leader>dus",
    function()
      local widgets = require "dap.ui.widgets"
      local sidebar = widgets.sidebar(widgets.scopes)
      sidebar.open()
    end,
    desc = "Open sidebar",
  },
}

-- ai
wk.add {
  { "<leader>c", group = "AI" },
  { "<leader>cc", "<cmd>ChatGPTRun optimize_code<cr>", desc = "Optimize code" },
  { "<leader>ci", "<cmd>ChatGPT<cr>", desc = "ChatGPT" },
  { "<leader>cl", "<cmd>ChatGPTActAs<cr>", desc = "ChatGPT Act as" },
  { "<leader>co", "<cmd>ChatGPTRun translate<cr>", desc = "Translate" },
  { "<leader>ct", "<cmd>ChatGPTRun code_readability_analysis<cr>", desc = "Code Readability Analysis" },
  { "<leader>cx", "<cmd>ChatGPTRun explain_code<cr>", desc = "Explain code" },
}

-- neorg
-- map("n", "<leader>ng", "<cmd>Neorg<cr>", { desc = "Norg note", nowait = true })

-- treesitter context
-- map("n", "[c", function()
--   require("treesitter-context").go_to_context()
-- end, { desc = "jump to context", nowait = true })

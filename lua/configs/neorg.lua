local present, neorg = pcall(require, "neorg")

if not present then
  return
end

neorg.setup {
  load = {
    ["core.defaults"] = {},
    ["core.completion"] = {
      config = {
        engine = "nvim-cmp",
      },
    },
    ["core.concealer"] = {
      config = {
        icon_preset = "basic",
        folds = {
          enabled = true,
        },
      },
    },
    ["core.dirman"] = {
      config = {
        workspaces = {
          notes = "~/Work/neorg",
        },
      },
    },
    ["core.summary"] = {
      config = {
        strategy = "metadata",
      },
    },
    ["core.highlights"] = {
      config = {
        todo_items_match_color = "all",
      },
    },
  },
}
vim.o.foldlevel = 99
vim.o.conceallevel = 2


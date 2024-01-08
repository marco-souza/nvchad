---@type MappingsTable
local M = {}

M.personal = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    -- neogit
    ["<leader>gg"] = {
      function()
        require("neogit").open()
      end,
      opts = { desc = "Manage Git (Neogit)" },
    },

    -- lsp
    ["gf"] = { vim.lsp.buf.format, opts = { desc = "Rename variable name" } },
    ["gr"] = { vim.lsp.buf.rename, opts = { desc = "Rename variable name" } },
    ["gd"] = { vim.lsp.buf.definition, opts = { desc = "Go to Definition" } },
    ["gD"] = { vim.lsp.buf.references, opts = { desc = "Go to References" } },

    -- harpoon
    ["<leader>ml"] = {
      function()
        require("harpoon.ui").toggle_quick_menu()
      end,
    },
    ["<leader>mt"] = {
      function()
        require("harpoon.term").gotoTerminal()
      end,
    },
    ["<leader>mm"] = {
      function()
        require("harpoon.mark").add_file()
      end,
    },
    ["<leader>mn"] = {
      function()
        require("harpoon.ui").nav_next()
      end,
    },
    ["<leader>mb"] = {
      function()
        require("harpoon.ui").nav_prev()
      end,
    },
  },
}

return M

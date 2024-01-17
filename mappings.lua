---@type MappingsTable
local M = {}

M.personal = {
  v = {
    -- alt navigation: https://vim.fandom.com/wiki/Moving_lines_up_or_down
    ["<A-j>"] = { ":m '>+1<CR>gv=gv", opts = { desc = "Move sally up" } },
    ["<A-k>"] = { ":m '<-2<CR>gv=gv", opts = { desc = "Move sally down" } },
  },
  i = {
    -- alt navigation: https://vim.fandom.com/wiki/Moving_lines_up_or_down
    ["<A-j>"] = { "<Esc>:m .+1<CR>==gi", opts = { desc = "Move sally up" } },
    ["<A-k>"] = { "<Esc>:m .-2<CR>==gi", opts = { desc = "Move sally down" } },
  },
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    -- alt navigation: https://vim.fandom.com/wiki/Moving_lines_up_or_down
    ["<A-j>"] = { ":m .+1<CR>==", opts = { desc = "Move sally up" } },
    ["<A-k>"] = { ":m .-2<CR>==", opts = { desc = "Move sally down" } },

    -- lsp
    ["gf"] = { vim.lsp.buf.format, opts = { desc = "Rename variable name" } },
    ["gr"] = { vim.lsp.buf.rename, opts = { desc = "Rename variable name" } },
    ["gd"] = { vim.lsp.buf.definition, opts = { desc = "Go to Definition" } },
    ["gD"] = { vim.lsp.buf.references, opts = { desc = "Go to References" } },
  },
}

return M

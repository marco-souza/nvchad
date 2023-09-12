local M = {}

M.treesitter = {
  ensure_installed = {
    "markdown",
    "markdown_inline",

    -- defaults 
    "vim",
    "lua",

    -- web dev 
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "json",

     -- low level
    "c",
    "zig",
    "rust",
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
    "deno",
    "prettier",
    "emmet_ls",

    -- rust stuff
    "rustfmt",
    "rust-analyzer",

    -- c/cpp stuff
    "clangd",
    "clang-format",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
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

return M

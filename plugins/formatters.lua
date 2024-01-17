---@type NvPluginSpec
return {
  {
    "nvimtools/none-ls.nvim",
    event = "LspAttach",
    config = function()
      local null_ls = require "null-ls"
      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
      local b = null_ls.builtins

      local sources = {
        -- lua
        b.formatting.stylua,
        b.diagnostics.luacheck,

        -- rust
        b.formatting.rustfmt,

        -- go
        b.formatting.gofumpt,
        b.formatting.goimports_reviser,
        b.formatting.golines,

        -- webdev
        b.formatting.eslint_d, -- so prettier works only on these filetypes
        b.formatting.prettier,

        -- other stuff
        b.diagnostics.todo_comments,
        b.diagnostics.trail_space,
        b.code_actions.refactoring,
      }

      local on_attach = function(client, bufnr)
        -- format on save
        if client.supports_method "textDocument/formatting" then
          vim.api.nvim_clear_autocmds {
            group = augroup,
            buffer = bufnr,
          }
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format { bufnr = bufnr }
            end,
          })
        end
      end

      null_ls.setup {
        debug = true,
        sources = sources,
        on_attach = on_attach,
      }
    end,
  },
}

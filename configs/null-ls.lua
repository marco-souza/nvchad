local present, null_ls = pcall(require, "null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

if not present then
  return
end

local b = null_ls.builtins

local config = {
  find_json = function()
    local cspell_user_path = vim.fn.resolve(vim.fn.getenv "HOME" .. "/.cspell.json")

    if vim.loop.fs_stat(cspell_user_path) then
      vim.fn.system {
        "touch",
        cspell_user_path,
      }
    end

    return cspell_user_path
  end,
}

local sources = {

  -- webdev stuff
  b.formatting.prettier, -- so prettier works only on these filetypes

  -- Lua
  b.formatting.stylua,

  -- rust
  b.formatting.rustfmt,

  -- go
  b.formatting.gofumpt,
  b.formatting.goimports_reviser,
  b.formatting.golines,

  -- spell
  b.diagnostics.cspell.with { config = config },
  b.code_actions.cspell.with { config = config },
}

local on_attach = function(client, bufnr)
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

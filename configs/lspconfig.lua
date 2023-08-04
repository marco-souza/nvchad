local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local function is_deno_project()
  local files = vim.fs.find(
    {'deno.json', 'deno.jsonc'},
    { upward = true }
  )
  -- if table has something, return true
  for _ in pairs(files) do return true end
  return false
end

local ts_lsp = "denols"
if not is_deno_project() then
  ts_lsp = "tsserver"
end

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", ts_lsp, "clangd", "rust_analyzer" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- 
-- lspconfig.pyright.setup { blabla}

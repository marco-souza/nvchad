local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

local function is_deno_project()
  local files = vim.fs.find({ "deno.json", "deno.jsonc" }, { upward = true })
  -- if table has something, return true
  for _ in pairs(files) do
    return true
  end
  return false
end

local ts_lsp = "denols"
if not is_deno_project() then
  ts_lsp = "tsserver"
end

-- if you just want default config for the servers then put them in a table
local servers = {
  "html",
  "cssls",
  ts_lsp,
  "clangd",
  "rust_analyzer",
  "emmet_ls",
  "gopls",
  "golines",
  "gofumpt",
  "goimports_reviser",
}

local configs = {
  gopls = {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
      gopls = {
        completeUnimported = true,
        usePlaceholders = true,
        analyses = {
          unusedparams = true,
        },
      },
    },
  },
}

for _, lsp in ipairs(servers) do
  local config = configs[lsp] or {}
  config.on_attach = on_attach
  config.capabilities = capabilities

  lspconfig[lsp].setup(config)
end

--
-- lspconfig.pyright.setup { blabla}
-- lspconfig.pyright.setup { blabla}

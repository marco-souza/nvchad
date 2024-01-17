local ensure_installed = {
  -- lua stuff
  "lua-language-server",
  "lua_ls",
  "stylua",

  -- web dev stuff
  "css-lsp",
  "html-lsp",
  "htmx-lsp",
  "typescript-language-server",
  "deno",
  "templ",
  "prettier",
  "emmet_ls",

  -- rust stuff
  "rustfmt",
  "rust-analyzer",

  -- c/cpp stuff
  "clangd",
  "clang-format",

  -- go suff
  "godoc",
  "gofmt",
  "gofumpt",
  "goimports-reviser",
}

-- if you just want default config for the servers then put them in a table
local lsp_servers = {
  "html",
  "cssls",
  "eslint",
  "clangd",
  "rust_analyzer",
  "emmet_ls",
  "gopls",
  -- "htmx_pls",
}

local function is_deno_project()
  local files = vim.fs.find({ "deno.json", "deno.jsonc" }, { upward = true })
  -- if table has something, return true
  for _ in pairs(files) do
    return true
  end
  return false
end

local function setup_js_server()
  local ts_lsp = "denols"
  if not is_deno_project() then
    ts_lsp = "tsserver"
  end

  table.insert(lsp_servers, ts_lsp)
end

local function lspconfig_setup()
  require "plugins.configs.lspconfig" -- default configs

  local on_attach = require("plugins.configs.lspconfig").on_attach
  local capabilities = require("plugins.configs.lspconfig").capabilities
  local lspconfig = require "lspconfig"
  local util = require "lspconfig/util"

  setup_js_server()

  local configs = {

    gopls = {
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
    eslint = {
      settings = {
        packageManager = "yarn",
      },
    },
    htmx = {
      filetypes = { "html", "tsx", "gotmpl" },
    },
    lua_ls = {
      settings = {
        Lua = {
          completion = {
            callSnippet = "Replace",
          },
        },
      },
    },
  }

  for _, lsp in ipairs(lsp_servers) do
    local config = configs[lsp] or {}
    config.on_attach = on_attach or {}
    config.capabilities = capabilities or {}

    lspconfig[lsp].setup(config)
  end
end

---@type NvPluginSpec[]
return {
  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    config = lspconfig_setup,
    dependencies = {
      {
        "williamboman/mason.nvim",
        config = true,
        opts = {
          automatic_installation = true,
          ensure_installed = ensure_installed,
        },
      },
      { "folke/neodev.nvim", opts = {} },
    },
  },
}

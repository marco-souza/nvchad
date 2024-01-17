---@type NvPluginSpec
return {
  {
    "marco-souza/ncm.nvim",
    cmd = "Config",
    dir = "~/workspace/marco-souza/ncm.nvim/",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
    },
    config = true,
  },
  {
    "marco-souza/ollero.nvim",
    event = "VeryLazy",
    dependencies = {
      "marco-souza/term.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
    },
    dir = "~/workspace/marco-souza/ollero.nvim/",
    opts = {},
  },

  -- TODO: waiting for https://github.com/huggingface/llm.nvim/pull/68
  -- {
  --   "noahbald/llm.nvim",
  --   event = "LspAttach",
  --   version = "main",
  --   opts = {
  --     -- model = "http://localhost:11434/api/generate",
  --     model = "http://localhost:11434/api/generate",
  --     adaptor = "ollama",
  --     request_body = { model = "codellama:7b-code" },
  --   },
  -- },
}

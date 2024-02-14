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

  {
    "huggingface/llm.nvim",
    event = "LspAttach",
    version = "main",
    opts = {
      model = "codellama:7b",
      backend = "ollama",
      url = "http://localhost:11434/api/generate",
      -- cf https://github.com/ollama/ollama/blob/main/docs/api.md#parameters
      request_body = {
        -- Modelfile options for the model you use
        options = {
          temperature = 0.2,
          top_p = 0.95,
        },
      },
    },
  },
}

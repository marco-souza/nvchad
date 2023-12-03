local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {
  -- Override plugin definition options
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "dkarter/bullets.vim",
    event = "InsertEnter",
    config = function()
      vim.g.bullets_enabled_file_types = {
        "markdown",
        "text",
        "gitcommit",
        "scratch",
      }
    end,
  },
  {
    "TimUntersberger/neogit",
    event = "InsertEnter",
    config = function()
      require("neogit").setup()
    end,
  },
  {
    "kylechui/nvim-surround",
    event = "InsertEnter",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  {
    "ThePrimeagen/harpoon",
    event = "InsertEnter",
    config = function()
      require("telescope").load_extension "harpoon"
    end,
  },
  {
    "wakatime/vim-wakatime",
    event = "VeryLazy",
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- AI
  {
    "marco-souza/ollero.nvim",
    name = "ollero",
    event = "VeryLazy",
    dependencies = { "nvim-telescope/telescope-ui-select.nvim" },
    dir = "~/w/marco-souza/ollero.nvim/",
    config = function()
      require("ollero").setup()
    end,
  },

  {
    "nomnivore/ollama.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },

    -- All the user commands added by the plugin
    cmd = { "Ollama", "OllamaModel", "OllamaServe", "OllamaServeStop" },

    keys = {
      -- Sample keybind for prompt menu. Note that the <c-u> is important for selections to work properly.
      {
        "<leader>oo",
        ":<c-u>lua require('ollama').prompt()<cr>",
        desc = "ollama prompt",
        mode = { "n", "v" },
      },

      -- Sample keybind for direct prompting. Note that the <c-u> is important for selections to work properly.
      {
        "<leader>oG",
        ":<c-u>lua require('ollama').prompt('Generate_Code')<cr>",
        desc = "ollama Generate Code",
        mode = { "n", "v" },
      },
    },

    ---@type Ollama.Config
    opts = {
      model = "llama2",
      -- url = "http://127.0.0.1:11434",
      -- serve = {
      --   on_start = false,
      --   command = "ollama",
      --   args = { "serve" },
      --   stop_command = "pkill",
      --   stop_args = { "-SIGTERM", "ollama" },
      -- },
      -- -- View the actual default prompts in ./lua/ollama/prompts.lua
      -- prompts = {
      --   Sample_Prompt = {
      --     prompt = "This is a sample prompt that receives $input and $sel(ection), among others.",
      --     input_label = "> ",
      --     model = "mistral",
      --     action = "display",
      --   },
      -- },
    },
  },
  -- {
  --   "huggingface/llm.nvim",
  --   event = "VeryLazy",
  --   opts = {
  --     model_eos = "<EOT>",
  --     fim = {
  --       enabled = true,
  --       prefix = "<PRE> ",
  --       middle = " <MID>",
  --       suffix = " <SUF>",
  --     },
  --     model = "codellama/CodeLlama-13b-hf",
  --     context_window = 4096,
  --     -- model = "http://localhost:11434/api/",
  --     -- tokenizer = {
  --     --   repository = "codellama/CodeLlama-13b-hf",
  --     -- }
  --   },
  -- },
  -- {
  --   name = "ollama",
  --   dir = "~/w/plugins/ollama.nvchad/",
  --   event = "VeryLazy",
  --   config = function ()
  --     require('ollama').setup()
  --   end
  -- },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins

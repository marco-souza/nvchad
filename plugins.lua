local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {
  -- Override plugin definition options
    -- {
    --   "neovim/nvim-lspconfig",
    --   dependencies = {
    --     -- format & linting
    --     {
    --       "jose-elias-alvarez/null-ls.nvim",
    --       config = function()
    --         require "custom.configs.null-ls"
    --       end,
    --     },
    --   },
    --   config = function()
    --     require "plugins.configs.lspconfig"
    --     require "custom.configs.lspconfig"
    --   end, -- Override to setup mason-lspconfig
    -- },
    --
    -- -- override plugin configs
    -- {
    --   "williamboman/mason.nvim",
    --   opts = overrides.mason
    -- },
    --
    -- {
    --   "nvim-treesitter/nvim-treesitter",
    --   opts = overrides.treesitter,
    -- },
    --
    -- {
    --   "nvim-tree/nvim-tree.lua",
    --   opts = overrides.nvimtree,
    -- },

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
      config = function()
        require'nvim-ts-autotag'.setup()
      end
    },
    {
      "dkarter/bullets.vim",
      config = function()
        vim.g.bullets_enabled_file_types = {
          'markdown',
          'text',
          'gitcommit',
          'scratch',
        }
      end
    },
    {
      "TimUntersberger/neogit",
      config = function()
        require'neogit'.setup()
      end
    },
    {
      "kylechui/nvim-surround",
      config = function()
        require'nvim-surround'.setup()
      end
    },
    {
      "ThePrimeagen/harpoon",
      config = function()
        require('telescope').load_extension('harpoon')
      end
    },
    {
      "aca/emmet-ls",
      config = require "custom.configs.emmet"
    },
    { "wakatime/vim-wakatime" },

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
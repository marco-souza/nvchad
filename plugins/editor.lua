return {
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = true,
  },
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    config = true,
  },
  {
    "kylechui/nvim-surround",
    event = "InsertEnter",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = true,
  },
  { "wakatime/vim-wakatime", event = "VeryLazy" },
  { "nvim-ts-autotag",       opts = {} },
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
    "nvim-tree/nvim-tree.lua",
    opts = {
      git = { enable = true },
      renderer = {
        highlight_git = true,
        icons = {
          show = { git = true },
        },
      },
    },
  },
}

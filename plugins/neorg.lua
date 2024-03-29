---@type NvPluginSpec
return {
  "nvim-neorg/neorg",
  ft = "norg",
  build = ":Neorg sync-parsers",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    load = {
      ["core.defaults"] = {},  -- Loads default behaviour
      ["core.concealer"] = {}, -- Adds pretty icons to your documents
      ["core.dirman"] = {      -- Manages Neorg workspaces
        config = {
          workspaces = {
            notes = "~/workspace/marco-souza/notes",
          },
        },
      },
    },
  },
}

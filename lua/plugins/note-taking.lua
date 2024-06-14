return {
  {
    "nvim-neorg/neorg",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    run = ":Neorg sync-parsers", -- This is the important bit!
    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {},
          ["core.concealer"] = {},
          ["core.summary"] = {},
          ["core.completion"] = {
            config = {
              engine = "nvim-cmp",
            },
          },
          ["core.dirman"] = {
            config = {
              workspaces = {
                go = "~/Work/Learning/go/notes/",
                kubernetes = "~/Work/Learning/kubernetes/notes/",
              },
            },
          },
        },
      })
    end,
  },
}

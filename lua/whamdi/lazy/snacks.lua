return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        files = { exclude = { "node_modules", "generated" } },
        grep  = { exclude = { "node_modules", "generated" } },
      },
    },
    explorer = {},
  },
  keys = {
    { "<leader>ff", function() require("snacks.picker").files() end, desc = "Find Files" },
    { "<leader>fm", function() require("snacks.picker").smart() end,  desc = "Find Files (Smart)" },
    { "<leader>fw", function() require("snacks.picker").grep() end,   desc = "Find Words" },
    { "<leader>fc", function() require("snacks.picker").files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
    { "<leader>e",  function() require("snacks.explorer").open() end, desc = "Open Explorer" }
  },
}

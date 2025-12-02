return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  dependencies = {
    "echasnovski/mini.nvim",
  },
  opts = {
    bigfile = { enabled = true },
    dashboard = { enabled = false },
    explorer = { enabled = false },
    indent = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = true },
    picker = { enabled = true },
    quickfile = { enabled = false },
    scope = { enabled = true },
    scroll = { enabled = false },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
  keys = {
    -- bufdelete
    {
      "<leader>bd",
      function()
        require("snacks").bufdelete.delete()
      end,
      desc = "kill",
    },
    {
      "<leader>bD",
      function()
        require("snacks").bufdelete.other()
      end,
      desc = "kill others",
    },
    {
      "<leader>b<BS>",
      function()
        require("snacks").bufdelete.all()
      end,
      desc = "kill all",
    },
    -- notifier
    {
      "<leader>xn",
      function()
        require("snacks").notifier.show_history()
      end,
      desc = "notifications",
    },
  },
}

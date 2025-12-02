return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    setup = function()
      require("neogit").setup({})
    end,
    keys = {
      { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "branches" },
      { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "commits" },
      { "<leader>gC", "<cmd>Telescope git_bcommits<cr>", desc = "buffer commits" },
      { "<leader>gf", "<cmd>Telescope git_files<cr>", desc = "files" },
      { "<leader>gg", "<cmd>Neogit kind=floating<cr>", desc = "neogit" },
      { "<leader>gG", "<cmd>Neogit kind=replace<cr>", desc = "neogit here" },
      { "<leader>gT", "<cmd>Neogit kind=tab<cr>", desc = "neogit tab" },
      { "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "status" },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
    },
  },
}

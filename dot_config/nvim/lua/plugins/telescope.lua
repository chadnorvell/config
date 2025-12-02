return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-fzf-native.nvim",
  },
  config = function()
    require("telescope").setup({
      pickers = {
        buffers = {
          sort_lastused = true,
        },
      },
    })
  end,
  keys = {
    { "<leader>/", "<cmd>Telescope resume<cr>", desc = "telescope resume" },
    { "<leader>?", "<cmd>Telescope pickers<cr>", desc = "telescope pickers" },

    { "<leader>bb", "<cmd>Telescope buffers<cr>", desc = "buffers" },
    { "<leader>bz", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "fzf" },
    { "<leader>bt", "<cmd>Telescope current_buffer_tags<cr>", desc = "tags" },

    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "find" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "grep" },
    { "<leader>fG", "<cmd>Telescope grep_string<cr>", desc = "grep this string" },

    { "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "commands" },
    { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "help" },
    { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "keymaps" },
    { "<leader>sj", "<cmd>Telescope jumplist<cr>", desc = "jumps" },
    { "<leader>s/", "<cmd>Telescope search_history<cr>", desc = "searches" },
  },
}

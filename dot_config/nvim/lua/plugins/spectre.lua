return {
  "nvim-pack/nvim-spectre",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    {
      "<leader>ss",
      function()
        require("spectre").toggle()
      end,
      desc = "spectre",
    },
    {
      "<leader>sw",
      function()
        require("spectre").open_visual({ select_word = true })
      end,
      desc = "spectre this word",
    },
    {
      "<leader>sw",
      function()
        require("spectre").open_visual()
      end,
      mode = "v",
      desc = "spectre this word",
    },
    {
      "<leader>sf",
      function()
        require("spectre").open_file_search({ select_word = true })
      end,
      desc = "spectre this file",
    },
  },
}

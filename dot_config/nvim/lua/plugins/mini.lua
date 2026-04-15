return {
  "nvim-mini/mini.nvim",
  version = false,
  config = function()
    require("mini.comment").setup()
    require("mini.icons").setup()
    require("mini.files").setup()
    require("mini.move").setup()
    require("mini.pairs").setup()
    require("mini.surround").setup()
  end,
  keys = {
    {
      "<leader>fm",
      function()
        require("mini.files").open()
      end,
      desc = "mini",
    },
  },
}

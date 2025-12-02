return {
  "echasnovski/mini.nvim",
  version = false,
  config = function()
    require("mini.comment").setup()
    require("mini.icons").setup()
    require("mini.move").setup()
    require("mini.pairs").setup()
    require("mini.surround").setup()
  end,
}

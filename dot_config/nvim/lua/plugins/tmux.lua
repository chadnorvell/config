return {
  "aserowy/tmux.nvim",
  priority = 1000,
  lazy = false,
  config = function()
    require("tmux").setup({
      navigation = {
        enable_default_keybindings = false,
      },
    })
  end,
}

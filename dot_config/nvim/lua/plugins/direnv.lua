return {
  "NotAShelf/direnv.nvim",
  config = function()
    require("direnv").setup({
      statusline = {
        enabled = true,
      },

      keybindings = {
        allow = "<Leader>va",
        deny = "<Leader>vd",
        reload = "<Leader>vr",
        edit = "<Leader>ve",
      },
    })
  end,
}

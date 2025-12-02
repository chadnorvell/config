return {
  "nanozuki/tabby.nvim",
  priority = 1000,
  lazy = false,
  dependencies = {
    "folke/snacks.nvim",
  },
  config = function()
    require("tabby").setup({
      preset = "tab_only",
      option = {
        theme = {
          fill = "TabLineFill", -- tabline background
          head = "TabLine", -- head element highlight
          current_tab = "TabLineSel", -- current tab label highlight
          tab = "TabLine", -- other tab label highlight
          win = "TabLine", -- window highlight
          tail = "TabLine", -- tail element highlight
        },
      },
      nerdfont = true,
      tab_name = {
        name_fallback = function(tabid)
          return tabid
        end,
      },
      buf_name = "relative",
    })
  end,
  keys = {
    { "<leader>tc", "<cmd>:$tabnew<cr>", desc = "new" },
    { "<leader>tx", "<cmd>:tabclose<cr>", desc = "kill" },
    { "<leader>tt", "<cmd>:Tabby pick_window<cr>", desc = "switch" },
    { "<leader>to", "<cmd>:tabonly<cr>", desc = "only" },
    { "<leader>t]", "<cmd>:tabn<cr>", desc = "next" },
    { "<leader>t[", "<cmd>:tabp<cr>", desc = "prev" },
    { "<leader>t.", "<cmd>:+tabmove<cr>", desc = "move next" },
    { "<leader>t,", "<cmd>:-tabmove<cr>", desc = "move prev" },
    { "<leader>tR", "<cmd>:Tabby rename_tab<cr>", desc = "rename default" },
    {
      "<leader>tr",
      function()
        vim.ui.input({
          prompt = "New tab name",
        }, function(value)
          if value ~= nil then
            require("tabby").tab_rename(value)
          end
        end)
      end,
      desc = "rename",
    },
  },
}

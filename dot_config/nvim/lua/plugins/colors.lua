local function load_nordic()
  local nordic = require("nordic")
  vim.o.background = "dark"
  nordic.load()
end

local function load_everforest_dark()
  local everforest = require("everforest")
  vim.o.background = "dark"
  everforest.setup({ background = "hard" })
  everforest.load()
end

local function load_everforest_light()
  local everforest = require("everforest")
  vim.o.background = "light"
  everforest.setup({ background = "soft" })
  everforest.load()
end

local function load_gruvbox_dark()
  local gruvbox = require("gruvbox")
  vim.o.background = "dark"
  gruvbox.load()
end

local function load_gruvbox_light()
  local gruvbox = require("gruvbox")
  vim.o.background = "light"
  gruvbox.load()
end

return {
  {
    "AlexvZyl/nordic.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      if vim.g.neovide then
        load_gruvbox_dark()
      end
    end,
    keys = {
      {
        "<leader>ucn",
        load_nordic,
        desc = "nordic",
      },
    },
  },
  {
    "neanias/everforest-nvim",
    lazy = false,
    priority = 1000,
    config = function()
      if not vim.g.neovide then
        load_everforest_dark()
      end
    end,
    keys = {
      {
        "<leader>uce",
        load_everforest_dark,
        desc = "everforest dark",
      },
      {
        "<leader>ucE",
        load_everforest_light,
        desc = "everforest light",
      },
    },
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = true,
    keys = {
      {
        "<leader>ucg",
        load_gruvbox_dark,
        desc = "gruvbox dark",
      },
      {
        "<leader>ucG",
        load_gruvbox_light,
        desc = "gruvbox light",
      },
    },
  },
}

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    spec = {
      { "<leader>a", group = "autosession" },
      { "<leader>b", group = "buffers" },
      { "<leader>c", group = "code" },
      { "<leader>g", group = "git" },
      { "<leader>s", group = "search" },
      { "<leader>t", group = "tabs" },

      { "<leader>h", group = "health" },
      { "<leader>hh", "<cmd>checkhealth vim.health<cr>", desc = "vim" },
      { "<leader>hl", "<cmd>checkhealth vim.lsp<cr>", desc = "lsp" },
      { "<leader>ht", "<cmd>checkhealth vim.treesitter<cr>", desc = "treesitter" },

      { "<leader>x", group = "diagnostics" },
      {
        "<leader>xl",
        function()
          vim.diagnostic.config({ virtual_lines = not vim.diagnostic.config().virtual_lines })
        end,
        desc = "toggle virtual lines",
      },
      {
        "<leader>xt",
        function()
          vim.diagnostic.config({ virtual_text = not vim.diagnostic.config().virtual_text })
        end,
        desc = "toggle virtual text",
      },

      { "<leader>f", group = "files" },
      { "<leader>fs", vim.cmd.w, desc = "save" },

      { "<leader>l", group = "lazy" },
      {
        "<leader>lc",
        function()
          require("lazy").check()
        end,
        desc = "check",
      },
      {
        "<leader>li",
        function()
          require("lazy").install()
        end,
        desc = "install",
      },
      {
        "<leader>ll",
        function()
          require("lazy").home()
        end,
        desc = "home",
      },
      {
        "<leader>ls",
        function()
          require("lazy").sync()
        end,
        desc = "sync",
      },
      {
        "<leader>lu",
        function()
          require("lazy").update()
        end,
        desc = "update",
      },
      {
        "<leader>lx",
        function()
          require("lazy").clean()
        end,
        desc = "clean",
      },

      { "<leader>q", group = "quit" },
      { "<leader>qq", vim.cmd.qa, desc = "this" },
      { "<leader>qa", vim.cmd.qa, desc = "all" },

      { "<leader>u", group = "ui" },
      { "<leader>uc", group = "color scheme" },

      { "<leader>v", group = "direnv " },
      {
        "<leader>va",
        function()
          require("direnv").allow_direnv()
        end,
        desc = "allow",
      },
      {
        "<leader>vd",
        function()
          require("direnv").deny_direnv()
        end,
        desc = "deny",
      },
      {
        "<leader>ve",
        function()
          require("direnv").edit_envrc()
        end,
        desc = "edit",
      },
      {
        "<leader>vr",
        function()
          require("direnv").check_direnv()
        end,
        desc = "reload",
      },

      { "<leader>H", vim.cmd.noh, desc = "clear highlight" },
    },
  },
  keys = {
    {
      "<leader>!",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "which key",
    },
    {
      "<leader>w",
      function()
        require("which-key").show({ keys = "<c-w>", loop = true })
      end,
      desc = "windows",
    },
  },
}

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    spec = {
      { "<leader>b", group = "buffers" },
      { "<leader>c", group = "code" },
      { "<leader>g", group = "git" },
      { "<leader>s", group = "search" },
      { "<leader>t", group = "tabs" },
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
      { "<leader>qa", vim.cmd.qa, desc = "all" },

      { "<leader>u", group = "ui" },
      { "<leader>uc", group = "color scheme" },

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

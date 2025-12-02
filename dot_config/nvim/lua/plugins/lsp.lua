return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp", opts = {} },
      { "folke/which-key.nvim", opts = {} },
      { "j-hui/fidget.nvim", opts = {} },
    },
    config = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),

        callback = function(event)
          local wk = require("which-key")

          wk.add({
            {
              "<leader>ca",
              vim.lsp.buf.code_action,
              desc = "action",
              mode = { "n", "x" },
            },

            { "<leader>ch", vim.lsp.buf.hover, desc = "hover" },
            { "<leader>cl", vim.lsp.buf.declaration, desc = "declaration" },
            { "<leader>cr", vim.lsp.buf.rename, desc = "rename" },

            {
              "<leader>cd",
              require("telescope.builtin").lsp_definitions,
              desc = "code defs",
            },
            {
              "<leader>cf",
              require("telescope.builtin").lsp_references,
              desc = "refs",
            },
            {
              "<leader>ci",
              require("telescope.builtin").lsp_implementations,
              desc = "impls",
            },

            {
              "<leader>cp",
              require("telescope.builtin").lsp_dynamic_workspace_symbols,
              desc = "symbols in project",
            },

            {
              "<leader>cs",
              require("telescope.builtin").lsp_document_symbols,
              desc = "symbols in doc",
            },

            {
              "<leader>ct",
              require("telescope.builtin").lsp_type_definitions,
              desc = "type defs",
            },
          })
        end,
      })

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local servers = {
        clangd = {},
        clojure_lsp = {},
        elixirls = {
          cmd = { "./.nix/elixir-ls" },
        },
        emmet_language_server = {
          filetypes = {
            "css",
            "heex",
            "html",
            "javascriptreact",
            "svelte",
            "typescriptreact",
          },
        },
        eslint = {
          on_attach = function(client, bufnr)
            local wk = require("which-key")

            wk.add({
              {
                "<leader>xf",
                "EslintFixAll<CR>",
                buffer = bufnr,
                desc = "fix all problems",
              },
            })
          end,
        },
        fish_lsp = {},
        lua_ls = {},
        nil_ls = {},
        rust_analyzer = {},
        statix = {},
        svelte = {},
        tailwindcss = {
          filetypes = {
            "css",
            "eelixir",
            "elixir",
            "html",
            "html-eex",
            "heex",
            "javascript",
            "javascriptreact",
            "svelte",
            "typescript",
            "typscriptreact",
          },
        },
        ts_ls = {},
      }

      for server_name, server_settings in pairs(servers) do
        server_settings.capabilities =
          vim.tbl_deep_extend("force", {}, capabilities, server_settings.capabilities or {})

        vim.lsp.config(server_name, server_settings)
        vim.lsp.enable(server_name)
      end
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "InsertEnter",
    opts = {
      bind = true,
      toggle_key = "<C-s>",
    },
  },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      opts.sources = opts.sources or {}
      table.insert(opts.sources, {
        name = "lazydev",
        group_index = 0,
      })
    end,
  },
}

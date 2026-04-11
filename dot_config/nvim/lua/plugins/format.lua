return {
  "stevearc/conform.nvim",
  opts = {
    format_on_save = { timeout_ms = 500 },
    formatters = {
      shfmt = {
        append_args = { "-i", "2" },
      },
    },
    formatters_by_ft = {
      lua = { "stylua" },
      markdown = { "mdformat" },
      python = { "ruff_format", "ruff_organize_imports" },
      rust = { "rustfmt" },
      sh = { "shfmt" },

      javascript = { "prettierd", "prettier", stop_after_first = true },
      javascriptreact = { "prettierd", "prettier", stop_after_first = true },
      typescript = { "prettierd", "prettier", stop_after_first = true },
      typescriptreact = { "prettierd", "prettier", stop_after_first = true },
      json = { "prettierd", "prettier", stop_after_first = true },
      html = { "prettierd", "prettier", stop_after_first = true },
      css = { "prettierd", "prettier", stop_after_first = true },
    },
  },
  keys = {
    {
      "<leader>bf",
      function()
        require("conform").format({ async = true, lsp_format = "fallback" })
      end,
      mode = "",
      desc = "format",
    },
  },
}

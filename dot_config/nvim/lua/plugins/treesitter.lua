return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = {
        "bash",
        "c",
        "cmake",
        "cpp",
        "css",
        "csv",
        "dockerfile",
        "fish",
        "html",
        "javascript",
        "json",
        "jsonc",
        "lua",
        "luadoc",
        "make",
        "python",
        "query",
        "ruby",
        "rust",
        "sql",
        "starlark",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
      },
      auto_install = true,
      sync_install = false,
      ignore_install = {},
      indent = { enable = true, disable = "ruby" },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { "ruby" },
      },
      modules = {},
    })
  end,
}

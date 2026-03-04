return {
  "nvim-orgmode/orgmode",
  event = "VeryLazy",
  ft = { "org" },
  config = function()
    require("orgmode").setup({
      org_default_notes_file = "~/docs/notes.org",
    })
  end,
}

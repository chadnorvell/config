return {
  "rmagatti/auto-session",
  opts = {
    session_lens = {
      load_on_setup = false,
    },
    suppressed_dirs = { "/", "~/", "~/dev" },
  },
  keys = {
    { "<leader>ad", "<cmd>AutoSession disable<cr>", desc = "disable" },
    { "<leader>ae", "<cmd>AutoSession enable<cr>", desc = "enable" },
    { "<leader>ap", "<cmd>AutoSession purgeOrphaned<cr>", desc = "purge orphaned" },
    { "<leader>as", "<cmd>AutoSession search<cr>", desc = "search" },
    { "<leader>ax", "<cmd>AutoSession deletePicker<cr>", desc = "delete" },
  },
}

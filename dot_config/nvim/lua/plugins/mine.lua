return {
  {
    "chadnorvell/yank-ref.nvim",
    config = function()
      require("yank-ref").setup()
    end,
    keys = {
      {
        "<leader>cy",
        function()
          require("yank-ref").yank_ref_normal_mode()
        end,
        desc = "yank ref",
      },
      {
        "<leader>cy",
        function()
          require("yank-ref").yank_ref_visual_mode()
        end,
        mode = "v",
        desc = "yank ref",
      },
    },
  },
}

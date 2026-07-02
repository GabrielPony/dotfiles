return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = function()
      return {
        preset = "helix",
        defaults = {},
        win = {
          border = "none",
          padding = { 0, 1 },
          title = false,
          wo = {
            winhighlight = "Normal:WhichKeyNormal,FloatBorder:WhichKeyNormal",
          },
        },
      }
    end,
  }
  
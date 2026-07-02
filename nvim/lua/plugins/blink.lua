return {
  "saghen/blink.cmp",
  opts = function(_, opts)
    opts = opts or {}
    opts.completion = vim.tbl_deep_extend("force", opts.completion or {}, {
      menu = {
        border = "none",
        scrollbar = false,
        winhighlight = "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenu,CursorLine:BlinkCmpMenuSelection,Search:None",
      },
      documentation = {
        window = {
          border = "none",
          scrollbar = false,
          winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDoc,EndOfBuffer:BlinkCmpDoc",
        },
      },
    })
    opts.signature = vim.tbl_deep_extend("force", opts.signature or {}, {
      window = {
        border = "none",
        scrollbar = false,
        winhighlight = "Normal:BlinkCmpSignatureHelp,FloatBorder:BlinkCmpSignatureHelp",
      },
    })
    return opts
  end,
}

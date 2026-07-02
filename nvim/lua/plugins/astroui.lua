-- AstroUI provides the basis for configuring the AstroNvim User Interface
-- Configuration documentation can be found with `:h astroui`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    -- change colorscheme
    colorscheme = "catppuccin",
    -- AstroUI allows you to easily modify highlight groups easily for any and all colorschemes
    highlights = {
      init = function()
        local transparent = vim.g.transparent_enabled
        local normal = vim.api.nvim_get_hl(0, { name = "Normal", link = false })
        local float = vim.api.nvim_get_hl(0, { name = "NormalFloat", link = false })
        local border = vim.api.nvim_get_hl(0, { name = "FloatBorder", link = false })
        local cursorline = vim.api.nvim_get_hl(0, { name = "CursorLine", link = false })
        local visual = vim.api.nvim_get_hl(0, { name = "Visual", link = false })
        local panel_bg = transparent and "NONE" or float.bg or normal.bg or "NONE"
        local panel_fg = float.fg or normal.fg
        local border_fg = transparent and "NONE" or border.fg or cursorline.bg or visual.bg or panel_bg
        local selection_bg = transparent and "NONE" or cursorline.bg or visual.bg or panel_bg

        return {
          -- Keep sidebars and plugin panels on a surface derived from the active theme.
          NeoTreeNormal = { fg = panel_fg, bg = panel_bg },
          NeoTreeNormalNC = { fg = panel_fg, bg = panel_bg },
          NeoTreeEndOfBuffer = { fg = panel_bg, bg = panel_bg },
          NeoTreeTabInactive = { fg = panel_fg, bg = panel_bg },
          NeoTreeTabActive = { fg = panel_fg, bg = panel_bg, bold = true },
          NeoTreeTabSeparatorInactive = { fg = panel_bg, bg = panel_bg },
          NeoTreeTabSeparatorActive = { fg = panel_bg, bg = panel_bg },
          StatusLine = { fg = panel_fg, bg = panel_bg },
          StatusLineNC = { fg = panel_fg, bg = panel_bg },
          AerialNormal = { fg = panel_fg, bg = panel_bg },
          AerialNormalNC = { fg = panel_fg, bg = panel_bg },
          AerialLine = { bg = selection_bg },
          GrugFarNormal = { fg = panel_fg, bg = panel_bg },
          GrugFarHelpHeader = { fg = panel_fg, bg = panel_bg, bold = true },
          NormalFloat = { fg = panel_fg, bg = panel_bg },
          FloatBorder = { fg = border_fg, bg = panel_bg },
          FloatTitle = { fg = panel_fg, bg = panel_bg, bold = true },
          WhichKeyNormal = { fg = panel_fg, bg = panel_bg },
          WhichKeyBorder = { fg = border_fg, bg = panel_bg },
          WhichKeyTitle = { fg = panel_fg, bg = panel_bg, bold = true },
          BlinkCmpMenu = { fg = panel_fg, bg = panel_bg },
          BlinkCmpMenuBorder = { fg = panel_bg, bg = panel_bg },
          BlinkCmpDoc = { fg = panel_fg, bg = panel_bg },
          BlinkCmpDocBorder = { fg = panel_bg, bg = panel_bg },
          BlinkCmpDocSeparator = { fg = panel_bg, bg = panel_bg },
          BlinkCmpSignatureHelp = { fg = panel_fg, bg = panel_bg },
          BlinkCmpSignatureHelpBorder = { fg = panel_bg, bg = panel_bg },
        }
      end,
      astrodark = { -- a table of overrides/changes when applying the astrotheme theme
        -- Normal = { bg = "#000000" },
      },
    },
    status = {
      colors = function(colors)
        local panel_bg = vim.g.transparent_enabled and "NONE" or colors.bg or colors.section_bg or "NONE"
        colors.bg = panel_bg
        colors.section_bg = panel_bg
        for _, section in ipairs({
          "git_branch",
          "file_info",
          "git_diff",
          "diagnostics",
          "lsp",
          "macro_recording",
          "cmd_info",
          "treesitter",
          "nav",
          "virtual_env",
        }) do
          colors[section .. "_bg"] = panel_bg
        end
        return colors
      end,
    },
    -- Icons can be configured throughout the interface
    icons = {
      -- configure the loading of the lsp in the status line
      LSPLoading1 = "⠋",
      LSPLoading2 = "⠙",
      LSPLoading3 = "⠹",
      LSPLoading4 = "⠸",
      LSPLoading5 = "⠼",
      LSPLoading6 = "⠴",
      LSPLoading7 = "⠦",
      LSPLoading8 = "⠧",
      LSPLoading9 = "⠇",
      LSPLoading10 = "⠏",
    },
  },
}

---@type MappingsTable
local M = {}

M.general = {
  n = {
    ["<leader>a"] = { "<cmd>AerialToggle!<CR>", "AerialToggle", opts = { nowait = true } },
    ["<leader>w"] = { "<cmd> w! <CR>", "Save"},
    ["<leader>q"] = { "<cmd> q! <CR>", "Quit"},
  },
  i = {
    ["jk"] = {"<Esc>", "ESC"},
  }
}

M.lspconfig = {
  n = {
    ["gq"] = {
      function()
        vim.diagnostic.setloclist()
      end,
      "Diagnostic setloclist",
    },

    ["gwa"] = {
      function()
        vim.lsp.buf.add_workspace_folder()
      end,
      "Add workspace folder",
    },

    ["gwr"] = {
      function()
        vim.lsp.buf.remove_workspace_folder()
      end,
      "Remove workspace folder",
    },

    ["gwl"] = {
      function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end,
      "List workspace folders",
    },
  },
}
-- more keybinds!

return M

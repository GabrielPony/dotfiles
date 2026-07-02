local M = {}

local providers = {
  osc52 = "osc52",
  tmux = "tmux",
  system = vim.NIL,
  auto = vim.NIL,
}

local function default_provider()
  return vim.env.TMUX and "tmux" or "osc52"
end

function M.use(provider)
  provider = provider or vim.g.clipboard_provider or default_provider()
  if providers[provider] == nil then
    vim.notify("Unknown clipboard provider: " .. provider, vim.log.levels.WARN)
    return
  end

  vim.g.clipboard_provider = provider
  vim.g.clipboard = providers[provider] ~= vim.NIL and providers[provider] or nil
  vim.opt.clipboard = "unnamedplus"

  if vim.g.loaded_clipboard_provider ~= nil then
    vim.g.loaded_clipboard_provider = nil
    vim.cmd.runtime("autoload/provider/clipboard.vim")
  end
end

function M.setup()
  M.use(vim.g.clipboard_provider or default_provider())
  vim.api.nvim_create_user_command("ClipboardProvider", function(args)
    M.use(args.args ~= "" and args.args or default_provider())
  end, {
    nargs = "?",
    complete = function() return { "tmux", "osc52", "system", "auto" } end,
    desc = "Choose Neovim clipboard provider",
  })
end

return M

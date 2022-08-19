local opts = { noremap = true, silent = true }

local function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
-- esc 
map("i", "jk", "<ESC>", opts)
map("v", "jk", "<ESC>", opts)
-- Tab> to navigate the completion menu
map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', opts)
-- map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})
-- map('n', '<F2>', ":NvimTreeToggle<cr>",{})

-- nvim tree setting --
map('n', 'ns', ":NvimTreeResize 30<cr>", opts)
map('n', 'n-', ":NvimTreeResize -5<cr>", opts)
map('n', 'n=', ":NvimTreeResize +5<cr>", opts)
map('n', 'nt', ":NvimTreeToggle<cr>", opts)
map('n', 'nw', "<C-w><C-w>",opts)

-- telescope setting --
map('n', "tg", ":Telescope live_grep<cr>", opts)
map('n', "tf", ":Telescope find_files<cr>", opts)

-- bufferline setting --
map("n", "bh", ":BufferLineCyclePrev<CR>", opts)
map("n", "bl", ":BufferLineCycleNext<CR>", opts)

-- default setting --
map('n', "<S-j>", "15j", opts)
map('n', "<S-k>", "15k", opts)

map('n', "at", ':AerialToggle!<CR>', opts)


local map = vim.keymap.set

map({"i", "v"}, "jk", "<ESC>", {desc = "ESC"})

map({"n"}, "<leader>w", "<cmd>w<cr><esc>", {desc = "Save files"})
map({"n"}, "<leader>q", "<cmd>q<cr><esc>", {desc = "Quit current buffer"})
map({"n"}, "<leader>wd","<cmd>call DeleteTrailingWS()<cr><esc>", {desc = "Delete space"})

map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })


map("n", "<A-h>", require('smart-splits').resize_left, { desc = "Resize left" })
map("n", "<A-j>", require('smart-splits').resize_down, { desc = "Resize down" })
map("n", "<A-k>", require('smart-splits').resize_up, { desc = "Resize up" })
map("n", "<A-l>", require('smart-splits').resize_right, { desc = "Resize right" })

map("n", "<C-h>", require('smart-splits').move_cursor_left, { desc = "Move cursor left" })
map("n", "<C-j>", require('smart-splits').move_cursor_down, { desc = "Move cursor down" })
map("n", "<C-k>", require('smart-splits').move_cursor_up, { desc = "Move cursor up" })
map("n", "<C-l>", require('smart-splits').move_cursor_right, { desc = "Move cursor right" })
map("n", "<C-\\>", require('smart-splits').move_cursor_previous, { desc = "Move cursor previous" })

map("n", "<leader><leader>h", require('smart-splits').swap_buf_left, { desc = "Swap buffer left" })
map("n", "<leader><leader>j", require('smart-splits').swap_buf_down, { desc = "Swap buffer down" })
map("n", "<leader><leader>k", require('smart-splits').swap_buf_up, { desc = "Swap buffer up" })
map("n", "<leader><leader>l", require('smart-splits').swap_buf_right, { desc = "Swap buffer right" })


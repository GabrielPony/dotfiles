local map = LazyVim.safe_keymap_set

map({"i", "v"}, "jk", "<ESC>", {desc = "ESC"})

map({"n"}, "<leader>w", "<cmd>w<cr><esc>", {desc = "Save files"})
map({"n"}, "<leader>q", "<cmd>q<cr><esc>", {desc = "Quit current buffer"})
map({"n"}, "<leader>wd","<cmd>call DeleteTrailingWS()<cr><esc>", {desc = "Delete space"})

map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

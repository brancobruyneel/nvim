local map = vim.keymap.set

map("n", "<c-j>", "<c-w><c-j>")
map("n", "<c-k>", "<c-w><c-k>")
map("n", "<c-l>", "<c-w><c-l>")
map("n", "<c-h>", "<c-w><c-h>")

for _, idx in ipairs { 1, 2, 3, 4, 5 } do
	map("n", string.format("<leader>%d", idx), "<CMD>")
end

-- git
map("n", "<leader>gp", "<CMD> G pull <CR>", { desc = "git pull" })

-- clipboard
map("n", "<leader>y", '"+y', { desc = "copy to system clipboard" })
map("v", "<leader>y", '"+y', { desc = "visual copy to system clipboard" })

-- nvimtree
map("n", "<leader>ne", "<cmd>NvimTreeToggle<CR>", { desc = "Nvimtree Toggle window" })

map('i', '<C-l>', function()
	vim.fn.feedkeys(vim.fn['copilot#Accept'](), '')
end, { desc = 'Copilot Accept', noremap = true, silent = true })

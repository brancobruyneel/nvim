vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("branco.highlight_yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

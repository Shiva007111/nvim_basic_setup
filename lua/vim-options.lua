vim.cmd("set tabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set expandtab")
vim.cmd("set clipboard=unnamedplus")
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.opt.scrolloff = 8
vim.opt.clipboard = "unnamedplus"
vim.g.mapleader = " "

vim.keymap.set("v", "<leader>d", '"_d', { desc = "Delete selection without yanking" })

vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      vim.api.nvim_win_set_cursor(0, mark)
    end
  end,
})



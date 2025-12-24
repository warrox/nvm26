vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "gd", "G", { desc = "Go to bottom of file" })
vim.keymap.set("n", "gu", "gg", { desc = "Go to top of file" })
-- switch insert mode to normal mode with jk
vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode with jk" })
--vim.keymap.set("n","0", "gg" )
vim.keymap.set("n","Tab", ":tabnew<CR>")
-- close current buffer
vim.keymap.set("n", "cc", ":bd<CR>", { desc = "Close current buffer" })
vim.keymap.set("n", "<C-s>", ":w<CR>", { desc = "Save file" })
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlights text when yanking",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

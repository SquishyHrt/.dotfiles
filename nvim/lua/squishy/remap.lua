vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])

vim.keymap.set("n", "<leader>t", '<Plug>(toggle-lsp-diag-on)')

vim.keymap.set("n", "<leader>tlo", "<Plug>(toggle-lsp-diag-off)")
vim.keymap.set("n", "<leader>tlf", "<Plug>(toggle-lsp-diag-on)")

vim.api.nvim_set_keymap("i", "<C-b>", "copilot#Accept('<CR>')", {expr=true, silent=true})

function ClangFile()
    local c = vim.api.nvim_win_get_cursor(0)
	vim.cmd [[:%!clang-format --style=file:/Users/paolowattebled/Documents/EPITA/S5/C_Prog/.clang-format]]
    vim.api.nvim_win_set_cursor(0, c)
end

vim.keymap.set("n", "<C-k>", ClangFile)


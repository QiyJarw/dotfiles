local opts = { noremap = true ,silent = true}
vim.g.mapleader=' ' --<Leader>キーの設定。<Space>ではうまくいかない
--[[矢印キーの無効化]]
vim.api.nvim_set_keymap('n','<UP>','<Nop>',opts)
vim.api.nvim_set_keymap('n','<Down>','<Nop>',opts)
vim.api.nvim_set_keymap('n','<Right>','<Nop>',opts)
vim.api.nvim_set_keymap('n','<Left>','<Nop>',opts)

vim.api.nvim_set_keymap('i','<Up>','<Nop>',opts)
vim.api.nvim_set_keymap('i','<Down>','<Nop>',opts)
vim.api.nvim_set_keymap('i','<Right>','<Nop>',opts)
vim.api.nvim_set_keymap('i','<Left>','<Nop>',opts)

vim.api.nvim_set_keymap('i','<C-j>','<Down>',opts)
vim.api.nvim_set_keymap('i','<C-k>','<Up>',opts)
vim.api.nvim_set_keymap('i','<C-h>','<Left>',opts)
vim.api.nvim_set_keymap('i','<C-l>','<Right>',opts)

--[[ｊキー二度押しでESCキー]]
vim.api.nvim_set_keymap('i','jj','<Esc>',opts)
vim.api.nvim_set_keymap('n','<Esc><ESC>',':nohlsearch<CR>',opts) --hlslens対策で<cmd>表記ではない

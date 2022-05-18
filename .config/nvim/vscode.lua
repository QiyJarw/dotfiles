vim.cmd([[
call plug#begin(stdpath('config') . '/plugs/')
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'phaazon/hop.nvim'

call plug#end()
]])

--settings
vim.o.clipboard='unnamed,unnamedplus'

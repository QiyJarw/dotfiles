require('goto-preview').setup{
	opacity = 13;
}

local opt = {noremap = true}
vim.api.nvim_set_keymap('n','gd',"<cmd>lua require('goto-preview').goto_preview_definition()<CR>",opt)

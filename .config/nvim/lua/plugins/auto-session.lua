require('auto-session').setup{
	log_level='info',
	auto_session_suppress_dirs = {'~/','~/div'},
	auto_session_enable_last_session = false,
	auto_session_root_dir = vim.fn.stdpath('data').."/sessions/",
	auto_session_enabled = true,
	auto_save_enabled = true,
	auto_restore_enabled = nil,

}

vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

--session-lenz
local opt = {noremap = true}
vim.api.nvim_set_keymap('n','<leader>os','<cmd>SearchSession<CR>',opt)

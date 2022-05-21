--telescope設定
--simple theme

-- local cmd = require('telescope.builtin')
-- local ext = require('telescope').extensions
require('telescope').setup{
  defaults = {
	  -- mappings = {
		  -- i = {
			  -- -- ["<leader>ff"] = cmd.find_files,
			  -- -- ["<leader>fb"] = cmd.buffers,
			  -- -- ["<leader>fg"] = cmd.live_grep,
			  -- -- ["<leader>gc"] = cmd.git_commits,
			  -- -- ["<leader>gh"] = cmd.help_tags,
			  -- -- ["<leader>m"] =  ext.vim_bookmarks.current_file,
			  -- -- ["<leader>M"] =  ext.vim_bookmarks.all,
			  -- -- ["<leader>z"] = ext.zoxide.list,
			  -- -- ["<leader>as"] = require('session-lens').search_session
		  -- }
	-- }
    },
  pickers = {
    find_files = {
    },
	buffers = {
		theme = "dropdown",
		previewer = false
	   },
	live_grep = {
		},
	-- file_browser = {
	-- 	theme = "dropdown"
	-- 	   },
	fd = {
		theme = "dropdown"
	},
	lsp_code_actions = {
		theme = "cursor"
	}

  },
	extensions = {
		fzf = {
			fuzzy = true
		},
	}
}

require('telescope').load_extension('fzf')
require('telescope').load_extension('zoxide')
require('telescope').load_extension('vim_bookmarks')
require('telescope').load_extension('session-lens')

--keymappings
local opts = {noremap = true}
vim.api.nvim_set_keymap('n','<Leader>ff',"<cmd>lua require('telescope.builtin').find_files()<CR>",opts)
vim.api.nvim_set_keymap('n','<Leader>fb',"<cmd>lua require('telescope.builtin').buffers()<CR>",opts)
vim.api.nvim_set_keymap('n','<Leader>fg',"<cmd>lua require('telescope.builtin').live_grep()<CR>",opts)
vim.api.nvim_set_keymap('n','<Leader>fh',"<cmd>lua require('telescope.builtin').help_tags()<CR>",opts)
vim.api.nvim_set_keymap('n','<Leader>gc',"<cmd>lua require('telescope.builtin').git_commits()<CR>",opts)
-- vim.api.nvim_set_keymap('n','<Leader>FF','<cmd>lua require('telescope.builtin').file_browser()<CR>',opts)
vim.api.nvim_set_keymap('n','<Leader>:',"<cmd>lua require('telescope.builtin').commands()<CR>",opts)
vim.api.nvim_set_keymap('n','<Leader>t','<cmd>TodoTelescope<CR>',opts)
vim.api.nvim_set_keymap('n','<Leader>z','<cmd>Telescope zoxide list<CR>',opts)
vim.api.nvim_set_keymap('n','<Leader>ca',"<cmd>lua require('telescope.builtin').lsp_code_actions()<CR>",opts)
vim.api.nvim_set_keymap('n','<Leader>os',"<cmd>lua require('session-lens').search_session()<CR>",opts)
vim.api.nvim_set_keymap('n','<Leader>m',"<cmd>lua require('telescope').extensions.vim_bookmarks.current_file()<cr>",opts)
vim.api.nvim_set_keymap('n','<Leader>M',"<cmd>lua require('telescope').extensions.vim_bookmarks.all()<cr>",opts)

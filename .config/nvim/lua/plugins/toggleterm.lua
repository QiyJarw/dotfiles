require('toggleterm').setup{
	size = 12, -- ターミナルのサイズ
	open_mapping = "<c-t>",
	hide_numbers = true,
	-- shade_filetypes = {},
	shade_terminals = true,
	start_in_insert = true, --ターミナルを開いた時にインサートモードで入る
	insert_mappings = true,
	persist_size = true,
	direction = 'horizontal', --ターミナルを開く方式
	close_on_exit = true, --プロセスをキルしたときにウィンドウを閉じる
	shell = vim.o.shell, --シェルの設定
	-- float ウィンドウ時の設定
	float_opts = {
		border = 'curved',
		width = 120,
		height = 30,
		winblend = 0, --custom promptが崩れるため0に設定
		highlights = {
			border = "Normal",
			background = "Normal"
		}
	}
}
vim.api.nvim_set_keymap('t','jj','<C-\\><C-n>',{noremap = true})

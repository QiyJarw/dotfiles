--nvim-treesitter設定
require 'nvim-treesitter.install'.compilers={"gcc"}
require 'nvim-treesitter.configs'.setup {
	ensure_installed = { "c","html","javascript","tsx","css","c_sharp","vim","lua","rust" },
	highlight = {
		enable = true,
		}
}

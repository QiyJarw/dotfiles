local plug_path = vim.fn.findfile("plug.vim",vim.fn.stdpath("data").."/site/autoload")

--[[plug.vim本体の確認]]
if vim.fn.empty(plug_path) == 1 then
	print("vim-plug not found. start instatlling...")
	if vim.fn.has("win32")==1 then --windowsの場合
		vim.api.nvim_command("! iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim|ni $Env:LOCALAPPDATA'/nvim-data/site/autoload/plug.vim' -Force")
	elseif vim.fn.has("unix")==1 or vim.fn.has("mac")==1 then --unix系統の場合
		vim.api.nvim_command([[!sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim']])
		vim.api.nvim_command('so %')
		vim.api.nvim_command('PlugInstall')
	end
end

--plugs settings
vim.cmd([[
call plug#begin(stdpath('data') . '/plugs/')
Plug 'vim-jp/vimdoc-ja'
Plug 'nvim-lua/plenary.nvim' "deps on telescope
Plug 'nvim-lua/popup.nvim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'lambdalisue/fern.vim' | Plug 'lambdalisue/fern-hijack.vim' | Plug 'lambdalisue/fern-renderer-nerdfont.vim' | Plug 'lambdalisue/glyph-palette.vim'
Plug 'yuki-yano/fern-preview.vim' | Plug 'lambdalisue/fern-git-status.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/vim-vsnip' | Plug 'hrsh7th/vim-vsnip-integ'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp' | Plug 'hrsh7th/cmp-vsnip' | Plug 'hrsh7th/cmp-buffer'
Plug 'onsails/lspkind-nvim'
Plug 'williamboman/nvim-lsp-installer'
Plug 'rmagatti/goto-preview'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'akinsho/bufferline.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do':':TSUpdate'}
Plug 'SmiteshP/nvim-gps'
"Plug 'nvim-lua/lsp-status.nvim'
Plug 'folke/trouble.nvim'
Plug 'rmagatti/auto-session'
Plug 'rmagatti/session-lens'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'alvan/vim-closetag',{'for':[ 'html','typescriptreact' ]}
Plug 'tpope/vim-commentary'
Plug 'phaazon/hop.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'cohama/lexima.vim'
Plug 'wellle/targets.vim'
Plug 'tpope/vim-fugitive'
" Plug 'airblade/vim-gitgutter'
Plug 'lewis6991/gitsigns.nvim'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim',{'do':'make'}
Plug 'rcarriga/nvim-notify'
Plug 'tom-anders/telescope-vim-bookmarks.nvim'
Plug 'jvgrootveld/telescope-zoxide'
"Plug 'goolord/alpha-nvim'
Plug 'nvim-orgmode/orgmode'
Plug 'akinsho/toggleterm.nvim'
Plug 'folke/todo-comments.nvim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'iamcco/markdown-preview.nvim', {'do': 'cd app && yarn install'}
Plug 'j-hui/fidget.nvim'
Plug 'kevinhwang91/nvim-hlslens'
Plug 'petertriho/nvim-scrollbar'
Plug 'folke/lsp-colors.nvim'
"themes
Plug 'ulwlu/elly.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'tomasr/molokai'
Plug 'joshdick/onedark.vim'
Plug 'cocopon/iceberg.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'w0ng/vim-hybrid'
Plug 'morhetz/gruvbox'
Plug 'sainnhe/everforest'
Plug 'sonph/onehalf'
Plug 'dracula/vim'
Plug 'jacoborus/tender'
Plug 'shaunsingh/nord.nvim'
Plug 'EdenEast/nightfox.nvim'
Plug 'rmehri01/onenord.nvim'
Plug 'Mofiqul/vscode.nvim'
call plug#end()
]])

local config = vim.fn.split(vim.fn.glob(vim.fn.stdpath('config') .. '/lua/plugins/' .. '*.lua'))
for _,plg in ipairs(config) do
	local ok, _ = pcall(require,'plugins/' .. vim.fn.fnamemodify(plg,':t:r'))
	if not ok then
		print(plg .. ' is not loaded.')
	end
end
--Plug 'kassio/neoterm' "pwshでうまく動かない

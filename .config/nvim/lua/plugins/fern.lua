---- "fern-nerd-font設定
-- let g:fern#renderer = "nerdfont"
-- 隠しファイルを表示するように設定
-- vim.cmd[[let g:fern#default_hidden=1]]
vim.g['fern#default_hidden'] = 1
-- vim.cmd([[let g:fern#renderer = "nerdfont"]]) --fernのアイコン設定に利用
vim.g['fern#renderer'] = "nerdfont"

--fern-preview設定

vim.cmd([[
  function! s:fern_settings() abort
  	nmap <silent> <buffer> p <Plug>(fern-action-preview:toggle) 
  	nmap <silent> <buffer> <C-p> <Plug>(fern-action-preview:auto:toggle)
  	nmap <silent> <buffer> <C-d> <Plug>(fern-action-preview:scroll:down:half)
  	nmap <silent> <buffer> <C-u> <Plug>(fern-action-preview:scroll:up:half)
  endfunction
augroup fern-settings
	autocmd!
	autocmd FileType fern call s:fern_settings()
	autocmd FileType fern set nonumber "fernでは行数を表示しない
augroup END
]])

-- "glyph-palette設定
vim.cmd([[
augroup my-glyph-paleette
	autocmd! *
	autocmd FileType fern call glyph_palette#apply()
	autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END
]])

vim.api.nvim_set_keymap('n','<Leader>b','<cmd>Fern . -reveal=% -drawer -toggle<CR>',{noremap = true})

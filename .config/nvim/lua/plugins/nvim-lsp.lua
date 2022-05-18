require('nvim-lsp-installer').setup{}
local lspconfig= require('lspconfig')
-- local lsp_status = require('lsp-status')
-- lsp_status.register_progress()

--表示するdiagnosticのアイコン変更
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

--language serverが起動したときに呼ばれる関数
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  --buf_set_option('omnifunc','v:lua.vim.lsp.omnifunc') --組み込みのautocompletionを有効化
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  -- below is overwrited by goto-preview.
  -- buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  -- buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  -- lsp_status.on_attach(client)
end

--capabilitiesを拡張
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
-- capabilities = vim.tbl_extend('keep', capabilities or {}, lsp_status.capabilities)


-- local sumneko_binary_path = vim.fn.exepath('lua-language-server')
-- local sumneko_root_path = vim.fn.fnamemodify(sumneko_binary_path, ':h:h:h')
-- local runtime_path = vim.split(package.path, ';')
-- table.insert(runtime_path, "lua/?.lua")
-- table.insert(runtime_path, "lua/?/init.lua")

--[[サーバーを有効にする]]
-- local servers = {'ccls','tsserver','rust_analyzer','html','cssls','sumneko_lua'}
-- for _,lsp in ipairs(servers) do
-- 	nvim_lsp[lsp].setup({
-- 		on_attach = on_attach,
-- 		capabilities = capabilities,
-- 		flags = {
-- 			debounce_text_changes = 150,
-- 		}
-- 	})
-- end

lspconfig.html.setup{
	on_attach = on_attach,
	capabilities = capabilities
}

lspconfig.cssls.setup{
	on_attach = on_attach,
	capabilities = capabilities
}

lspconfig.rust_analyzer.setup{
	on_attach = on_attach,
	capabilities = capabilities
}

lspconfig.sumneko_lua.setup{
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = {'vim'},
			},
		},
	},
}

lspconfig.tsserver.setup{
	on_attach = on_attach,
	capabilities = capabilities,
}

lspconfig.ccls.setup{
	on_attath = on_attach,
	capabilities = capabilities,
}

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {"lua_ls","rust_analyzer","tsserver","clangd","omnisharp_mono"}
})

vim.keymap.set('n', 'K', vim.lsp.buf.hover, { silent = true })
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").lua_ls.setup {}
require("lspconfig").rust_analyzer.setup {}
require("lspconfig").tsserver.setup {
	capabilities = capabilities
}


require("lspconfig").clangd.setup {
	capabilities = capabilities
}


require("lspconfig").omnisharp_mono.setup {	
	capabilities = capabilities
}




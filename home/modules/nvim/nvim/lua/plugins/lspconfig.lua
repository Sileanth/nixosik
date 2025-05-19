return {
	'neovim/nvim-lspconfig',
	dependencies = {

	},
	config = function()
		vim.lsp.enable('prolog_ls')
		vim.lsp.enable('ts_ls')
		vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float)


	end

}

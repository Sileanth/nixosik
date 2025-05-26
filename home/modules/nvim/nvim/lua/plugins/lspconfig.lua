return {
	'neovim/nvim-lspconfig',
	dependencies = {

	},
	config = function()
		vim.lsp.enable('prolog_ls')
		vim.lsp.enable('ts_ls')
		vim.lsp.enable('csharp_ls')
    vim.lsp.enable('svelte')
    wim.lsp.enable('nil_ls')
		vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float)


	end

}

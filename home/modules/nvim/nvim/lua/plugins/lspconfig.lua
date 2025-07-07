return {
	'neovim/nvim-lspconfig',
	dependencies = {

	},
	config = function()
		vim.lsp.enable('prolog_ls')
		vim.lsp.enable('ts_ls')
		vim.lsp.enable('csharp_ls')
    vim.lsp.enable('svelte')
    vim.lsp.enable('astro')
    vim.lsp.enable('clangd')

    vim.lsp.config('astro', {
      cmd = {"npx", "astro-ls", "--stdio" }
    })


    -- vim.lsp.enable('nil_ls')
    vim.lsp.enable('nixd')
		vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, {desc= 'diagnostisc'})
		vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, {desc= 'code action'})


	end

}

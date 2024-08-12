return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    "lukas-reineke/lsp-format.nvim",
    "folke/neodev.nvim",
    "williamboman/mason.nvim",
    'nanotee/sqls.nvim',
  },


  config = function()
    -- IMPORTANT: make sure to setup neodev BEFORE lspconfig
    require("neodev").setup({
      override = function(root_dir, library)
        if root_dir:find("/home/sileanth/nixosik", 1, true) == 1 then
          library.enabled = true
          library.plugins = true
        end
      end,
    })


    -- formatting on save, add on attach function to each lsp
    require("lsp-format").setup {}
    local on_attach = function(client, bufnr)
      require("lsp-format").on_attach(client, bufnr)
    end



    -- Setup language servers.
    local lspconfig = require('lspconfig')
    lspconfig.pyright.setup { on_attach = on_attach }
    lspconfig.lua_ls.setup { on_attach = on_attach }
    -- lspconfig.ccls.setup { on_attach = on_attach }
    lspconfig.clangd.setup { on_attach = on_attach }
    lspconfig.cmake.setup { on_attach = on_attach }
    lspconfig.ocamllsp.setup { on_attach = on_attach }
    lspconfig.nil_ls.setup { on_attach = on_attach }
    lspconfig.sqls.setup {
      on_attach = function(client, bufnr)
        require('sqls').on_attach(client, bufnr)
        -- formatter is broken
        -- require("lsp-format").on_attach(client, bufnr)
      end
    }





    -- Global mappings.
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
    vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        -- vim.keymap.set('n', '<space>wl', function()
        -- print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        -- end, opts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<space>lf', function()
          vim.lsp.buf.format { async = true }
        end, opts)
      end,
    })
  end


}

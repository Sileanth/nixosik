return {
  'stevearc/oil.nvim',
  config = function()
    vim.keymap.set('n', '<leader>o', function()
      vim.cmd('Oil')
    end, { desc = 'Open Oil (file explorer' })

    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    require("oil").setup(opts)


  end,
  -- Optional dependencies
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
}


return {
{
  'Julian/lean.nvim',
  event = { 'BufReadPre *.lean', 'BufNewFile *.lean' },

  dependencies = {
    'neovim/nvim-lspconfig',
    'nvim-lua/plenary.nvim',

    -- optional dependencies:

    -- a completion engine
       'Saghen/blink.cmp', 

    -- 'nvim-telescope/telescope.nvim', -- for 2 Lean-specific pickers
    'andymass/vim-matchup',          -- for enhanced % motion behavior
    -- 'andrewradev/switch.vim',        -- for switch support
    -- 'tomtom/tcomment_vim',           -- for commenting
  },

  ---@type lean.Config
  opts = { -- see below for full configuration options
    mappings = true,
  }
},
}


return {
  {
	  'catppuccin/nvim',
    priority = 1000,
    config = function()
      -- vim.cmd.colorscheme 'catppuccin-mocha'
    end,
  },
	'ellisonleao/gruvbox.nvim',
	'ayu-theme/ayu-vim',
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd.colorscheme 'tokyonight'
    end,
  }



}

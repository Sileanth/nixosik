return {
	{
	  "folke/tokyonight.nvim",
	  lazy = false,
	  priority = 1000,
	  -- opts = {},
	  config = function()
		  local export = require("../export")
		  vim.cmd("colorscheme " .. export.colorscheme)
	  end,
	},
	{
	  "catppuccin/nvim",
	  lazy = false,
	  priority = 1000,
	},

}

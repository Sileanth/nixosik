return {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      { "<leader>f", "<cmd> Telescope find_files<cr>", desc = "find file" },
      { "<leader>g", "<cmd> Telescope live_grep<cr>", desc = "live grep in files" },
      { "<leader>s", "<cmd> Telescope grep_string<cr>", desc = "grep string in files" }

    },
    config = function() 
      local builtin = require('telescope.builtin')
    end
}

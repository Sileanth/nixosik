return {
  {
    -- bb
    'echasnovski/mini.nvim',
    version = false,
    config = function()
      require('mini.ai').setup()
      require('mini.surround').setup()
      require('mini.pairs').setup()
      require('mini.operators').setup()
      require('mini.cursorword').setup()
      require('mini.bracketed').setup()
      -- aa
    end



  }
}

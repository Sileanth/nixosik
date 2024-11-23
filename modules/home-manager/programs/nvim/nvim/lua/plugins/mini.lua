return {
  {
    'echasnovski/mini.nvim',
    version = false,
    lazy = false,
    config = function()
      require('mini.ai').setup()
      require('mini.surround').setup()
      require('mini.pairs').setup()
      require('mini.operators').setup()
      require('mini.cursorword').setup()
      require('mini.bracketed').setup()
      require('mini.animate').setup()
      require('mini.trailspace').setup()
    end

  }
}

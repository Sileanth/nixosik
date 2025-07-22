-- tailwind-tools.lua
return {
  "luckasRanarison/tailwind-tools.nvim",
  lazy=false,
  name = "tailwind-tools",
  build = ":UpdateRemotePlugins",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "neovim/nvim-lspconfig", -- optional
  },
  keys = {

    {
      "<leader>tc", "<cmd>TailwindConcealToggle<cr>",
      desc = "Toggle visibility of tailwind classes",
    },
    {
      "<leader>ts", "<cmd>TailwindSort<cr>",
      desc = "Sort tailwind classes",
    },
  },
  opts = {} -- your configuration
}

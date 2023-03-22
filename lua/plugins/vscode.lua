return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      highlight = {
        enable = not vim.g.vscode,
      },
    },
  },
}

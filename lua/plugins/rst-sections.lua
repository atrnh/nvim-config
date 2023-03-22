-- https://github.com/atrnh/vim-rst-sections

return {
  "atrnh/vim-rst-sections",
  ft = { "rst" },
  keys = {
    { "<leader>d", "<cmd>call RstSectionDownCycle()<cr>", desc = "Demote heading", silent = true },
    { "<leader>u", "<cmd>call RstSectionUpCycle()<cr>", desc = "Promote heading", silent = true },
  },
}

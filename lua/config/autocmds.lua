-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd("User", {
  pattern = { "VeryLazy" },
  callback = function()
    vim.api.nvim_set_hl(0, "LeapMatch", { fg = "#c8d3f5", bg = "#fca7ea", bold = true })
    vim.api.nvim_set_hl(0, "LeapLabelPrimary", { fg = "#fca7ea", underline = true, bold = true })

    if vim.g.vscode then
      vim.api.nvim_set_hl(0, "LeapBackdrop", { fg = "#919191" })
      vim.api.nvim_set_hl(0, "LeapLabelPrimary", { fg = "#EF85DE", underline = true, bold = true })
      vim.api.nvim_set_hl(0, "LeapMatch", { fg = "#DBE6F1", bg = "#EF85DE", bold = true })
    end
  end,
})

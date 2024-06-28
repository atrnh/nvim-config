-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- function! s:switchEditor(...) abort
--     let count = a:1
--     let direction = a:2
--     for i in range(1, count ? count : 1)
--         call VSCodeCall(direction ==# 'next' ? 'workbench.action.nextEditorInGroup' : 'workbench.action.previousEditorInGroup')
--     endfor
-- endfunction
--
-- function! s:gotoEditor(...) abort
--     let count = a:1
--     call VSCodeCall(count ? 'workbench.action.openEditorAtIndex' . count : 'workbench.action.nextEditorInGroup')
-- endfunction

if vim.g.vscode then
  -- .notify(command, args, ...)

  local function switchEditor(count, direction)
    for i = 1, count or 1 do
      if direction == "next" then
        vscode.call("workbench.action.nextEditorInGroup")
      else
        vscode.call("workbench.action.previousEditorInGroup")
      end
    end
  end

  map(
    { "o", "x" },
    "gc",
    "<Cmd>call VSCodeCall('editor.action.commentLine')<CR><Esc>",
    { desc = "Toggle comment", noremap = true }
  )
  map(
    "n",
    "gc",
    "<Cmd>call VSCodeCall('editor.action.commentLine')<CR>",
    { desc = "Toggle comment linewise", noremap = true }
  )

  map(
    "x",
    "=",
    "<Cmd>call VSCodeCall('editor.action.formatSelection')<CR>",
    { desc = "Format selection", noremap = true }
  )
  map(
    "n",
    "=",
    "<Cmd>call VSCodeCall('editor.action.formatSelection')<CR><Esc>",
    { desc = "Format selection", noremap = true }
  )
  map(
    "n",
    "==",
    "<Cmd>call VSCodeCall('editor.action.formatSelection')<CR>",
    { desc = "Format selection", noremap = true }
  )

  map("n", "gt", "", {
    callback = function()
      switchEditor(vim.v.count, "next")
    end,
    noremap = true,
  })
  map("n", "gT", "", {
    callback = function()
      switchEditor(vim.v.count, "prev")
    end,
    noremap = true,
  })
end

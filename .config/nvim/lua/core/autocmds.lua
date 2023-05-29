local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd 

-- Highlight on yank
augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
  group = 'YankHighlight',
  callback = function()
    vim.highlight.on_yank({})
  end,
  pattern = '*',
})

-- Resize splits if window gets resized - Not working on kitty
--[[ autocmd('VimResized', {
  group = augroup('resize_splits', {}),
  callback = function()
    vim.cmd('tabdo wincmd =')
  end,
})
]]-- 

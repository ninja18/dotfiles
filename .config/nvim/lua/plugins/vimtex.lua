vim.g.tex_flavor = 'latex'
vim.g.vimtex_view_method = 'skim'
vim.g.vimtex_view_skim_sync = 1
vim.g.vimtex_quickfix_mode = 0
vim.g.vimtex_fold_enabled = true
vim.g.vimtex_fold_manual = false

vim.api.nvim_set_keymap('i', '<C-f>', '<Esc>: exec \'.!inkscape-figures create "\'.getline(\'.\').\'" "\'.b:vimtex.root.\'/figures/"\'<cr><cr>:w<cr>', { noremap = true, silent = true, })

-- " open popup to search for inkscape files in figures/ folder in normal mode
-- nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<cr><cr>:redraw!<cr>


local function map(mode, lhs, rhs, opts)
  local options = { noremap=true, silent=true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('n', '<leader>nl', ':nohl<CR>')
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')
map('i', '.', '.<c-g>u')
map('i', ',', ',<c-g>u')
map('i', '<CR>', '<CR><c-g>u')
map('n', '<leader>q', ':botright copen<CR>') -- Configure later: Revisit if these keys are used for others
map('n', '<leader>Q', ':cclose<CR>')
map('n', '<leader>l', ':lopen<CR>')
map('n', '<leader>L', ':lclose<CR>')

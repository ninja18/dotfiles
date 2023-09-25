local status_ok, nvim_treesitter = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
  return
end

nvim_treesitter.setup {
  ensure_installed = {
    'bash', 'c', 'cpp', 'go', 'json', 'lua', 'markdown', 'python', 'vim', 'tsx', 'css'
  },
  sync_install = false,
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
    disable = { 'python' },
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<M-space>',
    },
  },
  autotag = {
    enable = true,
  }
}

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false

-- Configure later: nvim-treesitter-textobjects is a great plugin do configs when needed
-- Problem: treesitter based folding works when file is opened from terminal but not through telescope for all language files

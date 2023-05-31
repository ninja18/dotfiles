local status_ok, nvim_treesitter = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
  return
end

nvim_treesitter.setup {
  ensure_installed = {
    'bash', 'c', 'cpp', 'go', 'json', 'lua', 'markdown', 'python', 'vim',
  },
  sync_install = false,
  highlight = {
    enable = true,
  },
}

-- Configure later: nvim-treesitter-textobjects is a great plugin do configs when needed

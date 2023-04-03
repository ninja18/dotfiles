local cmp = require('cmp')
  cmp.setup {
    snippet = {
		expand = function(args)
			vim.fn["UltiSnips#Anon"](args.body)
		end,
	},
    mapping = {
      ['<C-p>'] = cmp.mapping.select_prev_item(),
      ['<C-n>'] = cmp.mapping.select_next_item(),
      ['<C-9>'] = cmp.mapping.scroll_docs(-4),
      ['<C-0>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      })
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
	  { name = 'ultisnips' },
      { name = 'buffer' },
      { name = 'path' },
    })
  }

vim.api.nvim_command([[autocmd FileType clojure lua require'cmp'.setup.buffer {
  sources = {
    { name = 'buffer' },
    { name = 'conjure' },
    { name = 'nvim_lsp' },
    { name = 'path' },
  },
}]])

vim.api.nvim_command([[autocmd FileType plaintex,tex lua require'cmp'.setup.buffer {
  sources = {
    { name = 'omni' },
    { name = 'buffer' },
    { name = 'path' },
	{ name = 'ultisnips' },
  },
}]])

vim.api.nvim_command([[autocmd FileType lua,vim lua require'cmp'.setup.buffer {
  sources = {
    { name = 'buffer' },
    { name = 'nvim_lua' },
    { name = 'nvim_lsp' },
    { name = 'path' },
  },
}]])

vim.api.nvim_command([[autocmd FileType markdown,thoughts lua require'cmp'.setup.buffer {
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'emoji' },
  },
}]])

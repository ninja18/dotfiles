local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
  return
end

telescope.setup {
  extensions = {
    fzf = {
      fuzzy = true,                   -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true,    -- override the file sorter
      case_mode = "respect_case",       -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    }
  },
  defaults = {
    path_display={"smart"},
    mappings = {
      i = {
        ["<c-x>"] = "delete_buffer",
      },
    },
  }
}

pcall(telescope.load_extensions, 'fzf')

-- Key bindings
vim.keymap.set('n', '<leader><space>', function()
  require('telescope.builtin').buffers(
    require('telescope.themes').get_dropdown {
      previewer = false,
      layout_strategy = 'horizontal',
      layout_config = {
        width = 0.5,
        height = 0.6,
        prompt_position = 'top',
      },
    })
end, { desc = 'find existing buffers' })
vim.keymap.set('n', '<leader>ff', function()
  require('telescope.builtin').find_files(
    require('telescope.themes').get_dropdown {
      previewer = false,
      layout_strategy = 'horizontal',
      layout_config = {
        width = 0.5,
        height = 0.6,
        prompt_position = 'top',
      },
    })
end, { desc = 'find files in directory' })
vim.keymap.set('n', '<leader>fw', require('telescope.builtin').grep_string, { desc = 'grep string in buffer' })
vim.keymap.set('n', '<leader>fg', function()
  require('telescope.builtin').grep_string {
    shorten_path = true, word_match = "-w", only_sort_text = true, search = ''
  }
end, { desc = 'grep in directory' })
vim.keymap.set('n', '<leader>fe', require('telescope.builtin').live_grep, { desc = 'grep string in buffer' })
vim.keymap.set('n', '<leader>fd', require('telescope.builtin').diagnostics, { desc = 'search diagnostics' })
vim.keymap.set('n', '<leader>f?', require('telescope.builtin').builtin, { desc = 'show builtin pickers' })
vim.keymap.set('n', '<leader>gs', require('telescope.builtin').git_status, { desc = 'Search [G]it [S]tatus' })
vim.keymap.set('n', '<leader>/', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = 'Fuzzily search in current buffer' })

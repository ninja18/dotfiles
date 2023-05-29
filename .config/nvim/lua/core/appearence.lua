local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
  return
end

lualine.setup {
  options = {
    icons_enabled = false,
    theme = 'gruvbox-material',
    component_separators = '|',
    section_separators = '',
  },
  sections = {
    lualine_c = {
      { 'filename', path = 2, },
    },
    lualine_x = {}, -- Configure later: use this for lsp or git features after everything is done
    lualine_y = {'%l/%L'},
  },
}

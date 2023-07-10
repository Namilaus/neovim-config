require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'gruvbox', -- gruvbox is also good
  },
  sections = {
    lualine_a = {
      {
        'filename',
        path = 1,
      }
    }
  }
}

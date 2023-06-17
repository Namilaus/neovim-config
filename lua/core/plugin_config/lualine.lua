require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'molokai',
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

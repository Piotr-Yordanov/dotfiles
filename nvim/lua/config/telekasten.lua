require('telekasten').setup({
  home = vim.fn.expand("~/warehouse/vimwiki"), -- Put the name of your notes directory here
  take_over_my_home = false,
  auto_set_filetype = false,
  auto_set_syntax = false,
  tag_notation = 'yaml-bare'
})

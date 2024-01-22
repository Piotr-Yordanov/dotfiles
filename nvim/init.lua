require('plugins')
require('settings')
require('theme')
require('remaps')
require('config')


vim.g.himalaya_mailbox_picker = 'telescope'
vim.g.himalaya_telescope_preview_enabled = 1

vim.cmd 'runtime! extra.vim'

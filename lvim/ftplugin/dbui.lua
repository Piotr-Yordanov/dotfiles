vim.keymap.set('n', '<leader>S', '<Plug>(DBUI_SaveQuery)', { noremap = true, silent = true })
vim.g.db_ui_save_location = '~/db_ui_queries'

vim.keymap.set('n', '<leader>r', ':normal vip<CR><PLUG>(DBUI_ExecuteQuery)', { buffer = true })

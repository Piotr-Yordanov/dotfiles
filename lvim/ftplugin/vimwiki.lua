function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

-- vim.g.bullets_enabled_file_types = {
--   'markdown'
-- }

-- ['', '', '─', '│', '', '┐', '┘', '└'],
local border = {
  { "╭", "FloatBorder" },
  { "─", "FloatBorder" },
  { "╮", "FloatBorder" },
  { "│", "FloatBorder" },
  { "─", "FloatBorder" },
  { "─", "FloatBorder" },
  { "╰", "FloatBorder" },
  { "│", "FloatBorder" },
}
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border })
-- map('n', '<leader>gg', require("zen-mode").toggle({ window = { width = .85, height = .6 } }))
-- end
--
-- vim.keymap.set("i", "[[", "<cmd>Telekasten insert_link<CR>")
-- vim.keymap.set("i", "##", "<cmd>Telekasten show_tags<CR>")
--
--

-- VimWIKI
vim.g.vimwiki_path = '~/warehouse/vimwiki'
vim.g.vimwiki_list = { { path = '~/warehouse/vimwiki/', ext = '.md' } }
vim.g.vimwiki_map_prefix = '<Leader>W'
vim.g.vimwiki_ext2syntax = { ['.md'] = 'markdown' }

-- -- TaskWIKI
-- vim.g.taskwiki_disable_concealcursor = "yes"
-- vim.g.taskwiki_sort_orders = {"T": "due+,tags-,project-,urgency-"}
vim.api.nvim_set_keymap('n', '<leader>tw', ':TaskWikiMod wait:30days<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tW', ':TaskWikiMod wait:<CR>', { noremap = true, silent = true })

-- Highlighting
vim.cmd('highlight Normal guifg=#FFFFFF')

-- Mapping
vim.api.nvim_set_keymap('n', '<Leader>y', [[:echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"]], { noremap = true, silent = true })

vim.cmd [[
  autocmd BufReadPost * normal! zR
]]


vim.cmd [[
  let g:taskwiki_taskrc_location="~/.config/task/taskrc.default"
]]

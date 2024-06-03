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

-- -- TaskWIKI
vim.g.taskwiki_disable_concealcursor = "yes"

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

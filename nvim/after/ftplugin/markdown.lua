function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

vim.cmd(' setlocal conceallevel=2 ')
-- Add the key mappings only for Markdown files in a zk notebook.
-- if require("zk.util").notebook_root(vim.fn.expand('%:p')) ~= nil then
-- Open the link under the caret.
-- map("n", "<CR>", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
--
-- -- Create a new note after asking for its title.
-- -- This overrides the global `<leader>zn` mapping to create the note in the same directory as the current buffer.
-- -- map("n", "<leader>zn", "<Cmd>ZkNew { dir = vim.fn.expand('%:p:h'), title = vim.fn.input('Title: ') }<CR>", opts)
-- map("n", "<leader>zn", ":ZKCreateNewNote<CR>", opts)
-- map('v', '<leader>i', ":'<,'>ZkCustomNewFromTitleSelection<CR>")
-- -- map("v", "<leader>znc", ":'<,'>ZkNewFromContentSelection { dir = vim.fn.expand('%:p:h'), title = vim.fn.input('Title: ') }<CR>", opts)
-- map("v", "<leader>znc", ":'<,'>ZkCustomNewFromContentSelection { dir = vim.fn.expand('%:p:h')}<CR>", opts)
--
-- -- Open notes linking to the current buffer.
-- map("n", "<leader>zb", "<Cmd>ZkBacklinks<CR>", opts)
-- -- Alternative for backlinks using pure LSP and showing the source context.
-- --map('n', '<leader>zb', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
-- -- Open notes linked by the current buffer.
-- map("n", "<leader>zl", "<Cmd>ZkLinks<CR>", opts)
--
-- map("n", "<leader>zf", "<Cmd>ZkNotes<CR>", opts)
--
-- -- Preview a linked note.
-- map("n", "<space>p", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
-- -- Open the code actions for a visual selection.
-- map("v", "<leader>za", ":'<,'>lua vim.lsp.buf.range_code_action()<CR>", opts)
--
-- local zk = require("zk")
-- local commands = require("zk.commands")
--
--
-- local function make_edit_fn(defaults, picker_options)
--   return function(options)
--     options = vim.tbl_extend("force", defaults, options or {})
--     zk.edit(options, picker_options)
--   end
-- end
--
-- commands.add("ZkOrphans", make_edit_fn({ orphan = true }, { title = "Zk Orphans" }))
-- commands.add("ZkRecents", make_edit_fn({ createdAfter = "2 weeks ago" }, { title = "Zk Recents" }))

  -- This will start the hover
  -- vim.cmd([[
  --   set updatetime=500
  --   autocmd CursorHold * lua vim.lsp.buf.hover()
  --   autocmd BufWritePost * silent !sh ~/writing/second_brain/_scripts/copy.sh
  -- ]])


vim.g.bullets_enabled_file_types = {
  'markdown'
}

-- ['', '', '─', '│', '', '┐', '┘', '└'],
local border = {
      {"╭", "FloatBorder"},
      {"─", "FloatBorder"},
      {"╮", "FloatBorder"},
      {"│", "FloatBorder"},
      {"─", "FloatBorder"},
      {"─", "FloatBorder"},
      {"╰", "FloatBorder"},
      {"│", "FloatBorder"},
}
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {border = border})
-- map('n', '<leader>gg', require("zen-mode").toggle({ window = { width = .85, height = .6 } }))
-- end
--
vim.keymap.set("i", "[[", "<cmd>Telekasten insert_link<CR>")
vim.keymap.set("i", "##", "<cmd>Telekasten show_tags<CR>")

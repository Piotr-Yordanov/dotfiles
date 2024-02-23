function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
  map('n', shortcut, command)
end

nmap('<leader>w', ':w<CR>')
nmap('<leader>so', ':runtime! lua/*.lua<CR>:runtime! lua/config/init.lua<CR>')
nmap('<leader>pp', ':PackerInstall<CR>')
nmap('<leader>pc', ':PackerClean<CR>')

nmap('<leader>q', 'q')
-- nmap('q', ':w<CR>:bwipeout!<CR>')
nmap('q', ':bwipeout!<CR>')
nmap('<c-z>', ":redo<CR>")
nmap('<c-q>', ":bp<CR>")
nmap('<c-e>', ":bn<CR>")
nmap('<CR>', "o<ESC>")

nmap('<leader>T', ":TagbarToggle<CR>")

nmap(',/', ":noh<CR>")

local keymap = vim.api.nvim_set_keymap;
-- Easyalign
keymap("n", "ga", "<Plug>(EasyAlign)", { silent = true })
keymap("x", "ga", "<Plug>(EasyAlign)", { silent = true })

-- FZF
nmap('<c-f>', "<cmd>lua require('fzf-lua').files()<CR>")
nmap('<c-r>', "<cmd>lua require('fzf-lua').oldfiles()<CR>")
nmap('<leader>k', ":FzfLua files cwd=~/.config<CR>")
nmap('<leader>r', ":RG<CR>")
nmap('<c-h>', ":FzfLua live_grep<CR>")
nmap('H', ":FzfLua grep_cword<CR>")
nmap('<c-b>', ":FzfLua buffers<CR>")
nmap('<leader>f', ":FzfLua<CR>")

-- Tree
nmap('<c-l>', ":NvimTreeToggle<CR>")

-- Move line up or down
nmap('<c-j>', ':m +1 <CR>')
nmap('<c-k>', ':m -2 <CR>')

-- Scrolling
nmap('Zz', ':let &scrolloff=999-&scrolloff<CR>')

-- Hop
nmap('f', ":HopChar1<CR>")
nmap('<space>w', ":HopChar2<CR>")
nmap('<space>s', ":HopWord<CR>")
nmap('<space>j', ":HopLineAC<CR>")
nmap('<space>k', ":HopLineBC<CR>")
nmap('gd', ":Telescope lsp_definitions<CR>")

-- MKDX
nmap('<c-x>', '<Plug>(mkdx-checkbox-next-n)')

--- ZK
map('v', '<leader>i', ":'<,'>ZkNewFromTitleSelection<CR>")


nmap('<leader><space>', ":w<CR>:call jukit#splits#output()<cr>:call jukit#send#section(0)<cr>")

-- Zen Mode
nmap('<leader>ng', ":Twilight<CR>:TZAtaraxis<CR>:set wrap<CR>:ScrollbarToggle<CR>")

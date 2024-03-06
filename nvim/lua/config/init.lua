require'colorizer'.setup()

require'diffview'.setup()
require('mini.indentscope').setup()
require('mini.cursorword').setup()
require'hop'.setup()

require("scrollbar").setup()
require("scrollbar.handlers.search").setup()
require('nvim-autopairs').setup({
  disable_filetype = { "TelescopePrompt" , "vim" },
})

require'which-key'.setup()

require 'config.bufferline'
require 'config.lualine'
-- require 'config.coc'
require 'config.packageinfo'
require 'config.wilder'
require 'config.fzflua'
require 'config.gitsigns'
require 'config.blamer'
require 'config.nvim-tree'
require 'config.hlslens'
require 'config.zenmode'
require 'config.neoscroll'
require 'config.telescope'
require 'config.twilight'
require 'config.lsp'
require 'config.cmp'
require 'config.prettier'

-- LSP Config
require 'config.treesitter'

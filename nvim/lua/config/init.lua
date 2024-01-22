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

require('telescope').load_extension('media_files')


require 'config.bufferline'
require 'config.lualine'
require 'config.coc'
require 'config.packageinfo'
require 'config.wilder'
require 'config.fzflua'
require 'config.gitsigns'
require 'config.vista'
require 'config.blamer'
require 'config.nvim-tree'
require 'config.hlslens'
require 'config.zenmode'
require 'config.neoscroll'
require 'config.telekasten'



require("twilight").setup({
  context = 0,
  expand = {
    -- markdown
    "paragraph",
    "fenced_code_block",
    "list",
  }
})

-- require 'config.copilot'
-- require("mason").setup()
-- require("mason-lspconfig").setup()
-- require 'config.cmp'
-- require 'config.prettier'
require("onedarkpro").setup({
  highlights = {
    Comment = { italic = true },
    Directory = { bold = true },
    ErrorMsg = { italic = true, bold = true }
  },
  filetypes = {
    all = true
  }
})

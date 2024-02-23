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
require 'config.cmp'



-- Lua
----




-- LSP Config
local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Java
nvim_lsp.jdtls.setup {
  ensure_installed = { 'jdtls'},
  on_attach = on_attach,
  filetypes = { "java" },
  cmd = { "jdtls", "--stdio" },
  capabilities = capabilities
}

-- TypeScript
nvim_lsp.tsserver.setup {
  ensure_installed = { 'tsserver'},
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" },
  capabilities = capabilities
}

-- Tailwind
nvim_lsp.tailwindcss.setup {
  ensure_installed = { 'tailwindcss'},
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
}

-- Python
nvim_lsp.pyright.setup {
  filetypes = { "python" },
}

-- LSP Config

require 'config.treesitter'



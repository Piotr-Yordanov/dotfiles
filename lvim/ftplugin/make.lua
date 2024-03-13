-- Disable Treesitter for make files as it fails for whatever reason
require 'nvim-treesitter.configs'.setup {
  highlight = {
    enable = false,
  },
}

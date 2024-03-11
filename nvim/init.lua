vim.g.jukit_mappings_ext_enabled = "0"
require('plugins')
require('settings')
require('theme')
require('remaps')
require('config')

vim.cmd 'runtime! extra.vim'

vim.o.updatetime = 250
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end
})
vim.diagnostic.config({
  virtual_text = {
    -- source = "always",  -- Or "if_many"
    prefix = '●', -- Could be '■', '▎', 'x'
    -- prefix = function(diagnostic)
    --   local icons = require("config.icons").diagnostics
    --   if diagnostic.severity == vim.diagnostic.severity.ERROR then
    --     return "󰅙"
    --   elseif diagnostic.severity == vim.diagnostic.severity.WARN then
    --     return ""
    --   elseif diagnostic.severity == vim.diagnostic.severity.INFO then
    --     return "󰋼"
    --   else
    --     return "󰌵"
    --   end
    -- end,
  },
  severity_sort = true,
  float = {
    source = "always", -- Or "if_many"
  },
})

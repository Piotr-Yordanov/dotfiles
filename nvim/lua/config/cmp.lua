require("mason").setup()
require 'config.prettier'

--- CMP
local cmp = require'cmp'
local lspkind = require('lspkind')
local MAX_ITEMS = 4


local kind_icons = {
  Copilot = "",
  Text = "󰉿",
  Method = "󰆧",
  Function = "󰊕",
  Constructor = "",
  Field = "󰜢",
  Variable = "󰀫",
  Class = "󰠱",
  Interface = "",
  Module = "",
  Property = "󰜢",
  Unit = "󰑭",
  Value = "󰎠",
  Enum = "",
  Keyword = "󰌋",
  Snippet = "",
  Color = "󰏘",
  File = "󰈙",
  Reference = "󰈇",
  Folder = "󰉋",
  EnumMember = "",
  Constant = "󰏿",
  Struct = "󰙅",
  Event = "",
  Operator = "󰆕",
  TypeParameter = "",
}
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  performance = {
    debounce = 0,
    throttle = 0,
    fetching_timeout = 100,
    max_view_entries = 20,
  },
  view = {
    docs = {
      auto_open = true,
    },
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    {name = "copilot", group_index = 1, max_item_count = MAX_ITEMS},
    {name = 'ultisnips', max_item_count = MAX_ITEMS }, -- For ultisnips users.
    {name = 'path', group_index = 2, max_item_count = MAX_ITEMS},
    {name = 'nvim_lsp', group_index = 2, max_item_count = MAX_ITEMS4 },
    {name = 'buffer', group_index = 2, max_item_count = MAX_ITEMS4 },
    {name = 'treesitter', group_index = 2, max_item_count = MAX_ITEMS4 },
  }),
  window = {
    completion = {
        border = "rounded",
        -- winhighlight = "Normal:CmpNormal",
    },
  },
  formatting = {
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatenates the icons with the name of the item kind
      -- Source
      vim_item.menu = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        luasnip = "[LuaSnip]",
        nvim_lua = "[Lua]",
        latex_symbols = "[LaTeX]",
      })[entry.source.name]
      return vim_item
    end
  },
  -- formatting = {
  --   format = lspkind.cmp_format({
  --     mode = 'symbol', -- show only symbol annotations
  --     maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
  --                    -- can also be a function to dynamically calculate max width such as 
  --                    -- maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
  --     ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
  --     show_labelDetails = true, -- show labelDetails in menu. Disabled by default
  --
  --     -- The function below will be called before any actual modifications from lspkind
  --     -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
  --     before = function (entry, vim_item)
  --       -- Kind icons
  --       -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatenates the icons with the name of the item kind
  --       -- Source
  --       vim_item.menu = ({
  --         buffer = "[Buffer]",
  --         nvim_lsp = "[LSP]",
  --         luasnip = "[LuaSnip]",
  --         nvim_lua = "[Lua]",
  --         latex_symbols = "[LaTeX]",
  --       })[entry.source.name]
  --       return vim_item
  --     end
  --   })
  -- }
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
  }, {
    { name = 'buffer' },
  })
})




-- -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline({ '/', '?' }, {
--   mapping = cmp.mapping.preset.cmdline(),
--   sources = {
--     { name = 'path' }
--   }
-- })

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- NOT needed as i'm using the other plugin
-- cmp.setup.cmdline(':', {
--   mapping = cmp.mapping.preset.cmdline(),
--   sources = cmp.config.sources({
--     { name = 'path' }
--   }, {
--     { name = 'cmdline' }
--   })
-- })


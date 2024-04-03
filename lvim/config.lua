-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
vim.g.jukit_mappings_ext_enabled = "0"
vim.g.vimwiki_map_prefix         = "<leader>W"
vim.cmd [[
  let g:vimwiki_map_prefix = '<Leader>W'
  let g:vimwiki_ext2syntax = {'.md': 'markdown'}
  set foldmethod=manual
  " let taskwiki_disable_concealcursor="yes"
  " let vimwiki_conceallevel = 1
]]
lvim.leader = ","
lvim.builtin.terminal.open_mapping = "<c-t>"



lvim.plugins = {
  {
    'AstroNvim/astrotheme',
    config = function()
      require("astrotheme").setup({
        palette = "astrodark", -- String of the default palette to use when calling `:colorscheme astrotheme`
        background = {         -- :h background, palettes to use when using the core vim background colors
          light = "astrolight",
          dark = "astrodark",
        },
      })
    end
  },

  {
    'Vigemus/iron.nvim',
    config = function()
      local iron = require("iron.core")
      local view = require("iron.view")

      -- One can always use the default commands from vim directly
      repl_open_cmd = "vertical botright 50 split"

      iron.setup {
        config = {
          -- Whether a repl should be discarded or not
          scratch_repl = true,
          -- Your repl definitions come here
          repl_definition = {
            sh = {
              -- Can be a table or a function that
              -- returns a table (see below)
              command = { "zsh" }
            },
            python = {
              command = { "poetry run ipython3" }
            },
            rust = {
              command = { "irust" }
            },
          },
          -- How the repl window will be displayed
          -- See below for more information
          repl_open_cmd = repl_open_cmd
        },
        -- Iron doesn't set keymaps by default anymore.
        -- You can set them here or manually add keymaps to the functions in iron.core
        keymaps = {
          send_motion = "<space>sc",
          visual_send = "<space>sc",
          send_file = "<space>sf",
          send_line = "<space>sl",
          send_until_cursor = "<space>su",
          send_mark = "<space>sm",
          mark_motion = "<space>mc",
          mark_visual = "<space>mc",
          remove_mark = "<space>md",
          cr = "<space>s<cr>",
          interrupt = "<space>s<space>",
          exit = "<space>sq",
          clear = "<space>cl",
        },
        -- If the highlight is on, you can change how it looks
        -- For the available options, check nvim_set_hl
        highlight = {
          italic = true
        },
        ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
      }

      -- iron also has a list of commands, see :h iron-commands for all available commands
      vim.keymap.set('n', '<leader>rs', '<cmd>IronRepl<cr>')
      vim.keymap.set('n', '<leader>rr', '<cmd>IronRestart<cr>')
      vim.keymap.set('n', '<leader>rf', '<cmd>IronFocus<cr>')
      vim.keymap.set('n', '<leader>rh', '<cmd>IronHide<cr>')
      vim.keymap.set('n', '<leader><space', '<cmd>IronHide<cr>')
    end
  },
  {
    "petertriho/nvim-scrollbar",
    config = function()
      require("scrollbar").setup()
    end
  },
  { "logico/typewriter-vim" },
  { 'tomtom/tcomment_vim' },
  {
    "karb94/neoscroll.nvim",
    config = function()
      require('neoscroll').setup {
        -- All these keys will be mapped to their corresponding default scrolling animation
        mappings = { '<C-u>', '<C-d>', '<C-b>',
          '<C-y>', 'zt', 'zz', 'zb' },
        hide_cursor = true,          -- Hide cursor while scrolling
        stop_eof = true,             -- Stop at <EOF> when scrolling downwards
        respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        easing_function = nil,       -- Default easing function
        pre_hook = nil,              -- Function to run before the scrolling animation starts
        post_hook = nil,             -- Function to run after the scrolling animation ends
        performance_mode = false,    -- Disable "Performance Mode" on all buffers.
      }
    end
  },
  {
    'smoka7/hop.nvim',
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  },
  { 'luk400/vim-jukit' },
  {
    "stevearc/dressing.nvim",
    config = function()
      require("dressing").setup({
        input = { enabled = false },
      })
    end,
  },

  { 'vimwiki/vimwiki' },
  { 'tools-life/taskwiki' },


  { 'tpope/vim-dadbod' },
  { 'kristijanhusak/vim-dadbod-ui' },
  {
    'kristijanhusak/vim-dadbod-completion',
    filetype = { 'sql', 'mysql', 'plsql' },
    config = function()
      vim.cmd([[
 autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })
]])
    end
  },

  {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup()

      vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    end
  },

  {
    'stevearc/aerial.nvim',
    config = function()
      require("aerial").setup({
        -- optionally use on_attach to set keymaps when aerial has attached to a buffer
        on_attach = function(bufnr)
          -- Jump forwards/backwards with '{' and '}'
          vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
          vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
        end,

        layout = {
          min_width = 20,
          default_direction = "left"
        },
        attach_mode = "global",
        backends = { "lsp" },
        disable_max_lines = 1000000,
        show_guides = true,
        filter_kind = false,
        guides = {
          mid_item = "├ ",
          last_item = "└ ",
          nested_top = "│ ",
          whitespace = "  ",
        },
      })
      -- You probably also want to set a keymap to toggle aerial
      vim.keymap.set("n", "<leader>E", "<cmd>AerialToggle!<CR>")
      vim.keymap.set("n", "<leader>S", ":lua require('telescope').extensions.aerial.aerial()<CR>")
    end
  },

  -- Git
  { 'sindrets/diffview.nvim',  dependencies = 'nvim-lua/plenary.nvim' },

  -- Punctual Plugins
  -- { 'airblade/vim-rooter' }, -- Change the root dir to the current file

  -- Text processing / editing
  { 'tpope/vim-speeddating' }, -- Use CTRL-A/CTRL-X to increment dates, time, and more...
  { 'tpope/vim-repeat' },      -- `.` made awesome
  { 'farmergreg/vim-lastplace' },

  {
    'Exafunction/codeium.vim',
    config = function()
      vim.keymap.set('i', '<C-a>', function() return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
      -- vim.keymap.set('i', '<c-q>', function() return vim.fn['codeium#CycleCompletions'](1) end,
      --   { expr = true, silent = true })
      -- vim.keymap.set('i', '<c-e>', function() return vim.fn['codeium#CycleCompletions'](-1) end,
      --   { expr = true, silent = true })
      -- vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
    end
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      'nvim-lua/plenary.nvim',
      'jonarrien/telescope-cmdline.nvim',
    },
    keys = {
      { ':', '<cmd>Telescope cmdline<cr>', desc = 'Cmdline' }
    },
    config = function(_, opts)
      require("telescope").setup(opts)
      require("telescope").load_extension('cmdline')
    end,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
  }
}

lvim.colorscheme = "astrodark"
-- lvim.colorscheme = "typewriter-night"
--
lvim.autocommands = {
  {
    "BufEnter",          -- see `:h autocmd-events`
    {                    -- this table is passed verbatim as `opts` to `nvim_create_autocmd`
      pattern = { "*" }, -- see `:h autocmd-events`
      callback = function()
        local wins = vim.api.nvim_tabpage_list_wins(0)
        -- Both neo-tree and aerial will auto-quit if there is only a single window left
        if #wins <= 1 then return end
        local sidebar_fts = { aerial = true, ["neo-tree"] = true }
        for _, winid in ipairs(wins) do
          if vim.api.nvim_win_is_valid(winid) then
            local bufnr = vim.api.nvim_win_get_buf(winid)
            local filetype = vim.api.nvim_get_option_value("filetype", { buf = bufnr })
            -- If any visible windows are not sidebars, early return
            if not sidebar_fts[filetype] then
              return
              -- If the visible window is a sidebar
            else
              -- only count filetypes once, so remove a found sidebar from the detection
              sidebar_fts[filetype] = nil
            end
          end
        end
        if #vim.api.nvim_list_tabpages() > 1 then
          vim.cmd.tabclose()
        else
          vim.cmd.qall()
        end
      end,
    }
  },
  {
    "VimEnter",          -- see `:h autocmd-events`
    {                    -- this table is passed verbatim as `opts` to `nvim_create_autocmd`
      pattern = { "*" }, -- see `:h autocmd-events`
      callback = function()
        vim.cmd("AerialToggle!")
      end,
    }
  },
  {
    { "ColorScheme" },
    {
      pattern = "*",
      callback = function()
        --         vim.opt.termguicolors = true
        --         -- vim.opt.background = "dark"
        --         -- Clear highlight and set basic highlights
        vim.api.nvim_set_hl(0, "CursorLine", { bg = "#2a2a2a" })
        vim.api.nvim_set_hl(0, "Normal", { bg = "#1d1f21" })

        --         vim.api.nvim_set_hl(0, "Search", { bg = "None", fg = "Red" })
        --         vim.api.nvim_set_hl(0, "String", { fg = "#88aabb", ctermfg = 110 })
        --         vim.api.nvim_set_hl(0, "htmlTagName", { fg = "#696969", bold = true, italic = true })
        --         vim.cmd([[hi link tsxTagName htmlTagName]])
        --         -- Number, NERDTree, and Operator highlights
        --         vim.api.nvim_set_hl(0, "Number", { fg = "#ee7777", ctermfg = 208 })
        --         vim.api.nvim_set_hl(0, "NERDTreeFlags", { fg = "#88aabb", ctermfg = 208 })
        --         vim.api.nvim_set_hl(0, "Operator", { fg = "#888888" })
        --         -- Typescript highlights
        --         vim.api.nvim_set_hl(0, "typescriptPredefinedType", { fg = "#60687a", italic = true })
        --         vim.api.nvim_set_hl(0, "typescriptTypeReference", { fg = "#60687a", italic = true })

        --         -- -- Directory, COC, and Diagnostic highlights
        -- vim.api.nvim_set_hl(0, "Directory", { fg = "#aa4444" })
        --         -- vim.api.nvim_set_hl(0, "COCWarningSign", {fg = "#Af5fff"})
        --         -- vim.api.nvim_set_hl(0, "COCErrorSign", {fg = "#aa4444"})
        --         --
        -- -- Pmenu and Diagnostic highlights
        -- vim.api.nvim_set_hl(0, "Pmenu", { ctermfg = 250, ctermbg = 235, fg = "#bcbcbc", bg = "#262626" })
        -- vim.api.nvim_set_hl(0, "PmenuSel", { ctermfg = 250, ctermbg = 131, fg = "#bcbcbc", bg = "#af5f5f" })

        -- Lualine and whitespace highlights
        vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#ee7777" })
        vim.api.nvim_set_hl(0, "ExtraWhitespace", { bg = "#242424" })

        -- -- Git blamer, MiniIndentscope, and VertSplit color adjustments
        -- vim.api.nvim_set_hl(0, "GitSignsCurrentLineBlame", { fg = "#4c4c4c" })
        -- vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = "#343434" })
        -- vim.api.nvim_set_hl(0, "VertSplit", { bg = "#40452a", fg = "#1d1f21" })

        -- --" Neovim Indent-Blankline
        -- vim.api.nvim_set_hl(0, "IndentBlanklineChar", { fg = "#3a3a3a" })
        -- vim.api.nvim_set_hl(0, "IndentBlanklineSpaceChar", { fg = "#6c6c6c" })
        -- vim.api.nvim_set_hl(0, "IndentBlanklineSpaceCharBlankLine", { fg = "#6c6c6c" })
        -- vim.api.nvim_set_hl(0, "IndentBlanklineContextChar", { fg = "#6c6c6c" })

        -- NVIM_CMP
        vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { fg = "#808080", strikethrough = true })
        -- blue
        vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#569CD6" })
        vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#569CD6" })
        -- light blue
        vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = "#9CDCFE" })
        vim.api.nvim_set_hl(0, "CmpItemKindInterface", { fg = "#9CDCFE" })
        vim.api.nvim_set_hl(0, "CmpItemKindText", { fg = "#9CDCFE" })
        -- pink
        vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = "#C586C0" })
        vim.api.nvim_set_hl(0, "CmpItemKindMethod", { fg = "#C586C0" })
        -- front
        vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = "#D4D4D4" })
        vim.api.nvim_set_hl(0, "CmpItemKindProperty", { fg = "#D4D4D4" })
        vim.api.nvim_set_hl(0, "CmpItemKindUnit", { fg = "#D4D4D4" })

        -- Telescope
        vim.api.nvim_set_hl(0, "TelescopeNormal", { fg = "#6c6c6c" })
        vim.api.nvim_set_hl(0, "TelescopeSelection", { fg = "#D4D4D4" })
        vim.api.nvim_set_hl(0, "TelescopeMatching", { fg = "#C586C0" })
        vim.api.nvim_set_hl(0, "IlluminatedWord", { bg = "#3c3c3c" })
        vim.api.nvim_set_hl(0, "IlluminatedCurWord", { bg = "#3c3c3c" })
        vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = "#3c3c3c" })
        vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = "#3c3c3c" })
        vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = "#3c3c3c" })
        vim.api.nvim_set_hl(0, "jukit_cellmarker_colors", { fg = "#1d615a", bg = "#1d615a" })
      end,
    },
  },
}


-- Needed for supertab
-- REF: https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#luasnip
local cmp = require("cmp")
local luasnip = require("luasnip")

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end
lvim.builtin.cmp.mapping["<Tab>"] = cmp.mapping(function(fallback)
  if cmp.visible() then
    if vim.fn.exists('b:_codeium_completions') ~= 0 then
      vim.api.nvim_input(vim.fn['codeium#Accept']())
    end
  elseif luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  elseif has_words_before() then
    cmp.complete()
  else
    fallback()
  end
end, { "i", "s" })
lvim.builtin.cmp.mapping["<S-Tab>"] = cmp.mapping(function(fallback)
  if cmp.visible() then
    cmp.select_prev_item()
  elseif luasnip.jumpable(-1) then
    luasnip.jump(-1)
  else
    fallback()
  end
end, { "i", "s" })

local kind_icons = {
  Copilot = "",
  Codeium = "",
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


lvim.builtin.cmp.formatting = {
  format = function(entry, vim_item)
    -- Kind icons
    vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatenates the icons with the name of the item kind
    -- Source
    vim_item.menu = ({
      codeium = "[Codeium]",
      buffer = "[Buffer]",
      luasnip = "[LuaSnip]",
      nvim_lsp = "[LSP]",
      nvim_lua = "[Lua]",
      latex_symbols = "[LaTeX]",
    })[entry.source.name]
    return vim_item
  end
}



lvim.builtin.gitsigns.opts = {
  -- signs = {
  --   add          = { text = '+', },
  --   change       = { text = '~', },
  --   delete       = { text = '_', },
  --   topdelete    = { text = '‾', },
  --   changedelete = { text = '~_' },
  -- },
  current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 500,
    ignore_whitespace = false,
  },

}

lvim.format_on_save.enabled = true

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { name = "black" },
  {
    name = "prettier",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespace
    -- options such as `--line-width 80` become either `{"--line-width", "80"}` or `{"--line-width=80"}`
    args = { "--print-width", "100" },
    ---@usage only start in these filetypes, by default it will attach to all filetypes it supports
    filetypes = { "typescript", "typescriptreact" },
  },
}

lvim.builtin.telescope.extensions = {
  cmdline = {
    picker   = {
      layout_config = {
        width  = 120,
        height = 25,
      }
    },
    mappings = {
      complete      = '<Tab>',
      run_selection = '<C-CR>',
      run_input     = '<CR>',
    },
  },
}

lvim.keys.normal_mode["q"] = ":bwipeout!<CR>"
lvim.keys.normal_mode["<C-z>"] = ":redo<CR>"
lvim.keys.normal_mode["<C-q>"] = ":bp<CR>"
lvim.keys.normal_mode["<C-e>"] = ":bn<CR>"
lvim.keys.normal_mode["<CR>"] = "o<ESC>"

lvim.keys.normal_mode["<c-f>"] = ":Telescope find_files<ESC>"
lvim.keys.normal_mode["<c-r>"] = ":Telescope oldfiles<ESC>"
lvim.keys.normal_mode["<c-h>"] = ":Telescope live_grep<ESC>"
lvim.keys.normal_mode["H"] = ":Telescope grep_string<ESC>"



lvim.keys.normal_mode["<c-l>"] = ":NvimTreeToggle<CR>"
lvim.keys.normal_mode["<c-j>"] = ":m +1<CR>"
lvim.keys.normal_mode["<c-k>"] = ":m -2<CR>"

-- nmap('<leader>k', ":FzfLua files cwd=~/.config<CR>")
-- nmap('<leader>r', ":RG<CR>")
-- nmap('<c-b>', ":FzfLua buffers<CR>")
-- nmap('<leader>f', ":FzfLua<CR>")
--
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)



lvim.keys.normal_mode["f"]        = ":HopChar1<cr>"
lvim.keys.normal_mode["<space>w"] = ":HopChar2<cr>"
lvim.keys.normal_mode["<space>s"] = ":HopWord<cr>"
lvim.keys.normal_mode["<space>j"] = ":HopLineAC<cr>"
lvim.keys.normal_mode["<space>k"] = ":HopLineBC<cr>"
-- lvim.keys.normal_mode["Tab"] = ":HopLineBC<cr>"

-- Assuming you want to add custom mappings for the flash plugin
-- vim.api.nvim_set_keymap('n', 's', '<cmd>lua require("flash").jump()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-s>', '<cmd>lua require("flash").treesitter()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'R', '<cmd>lua require("flash").treesitter_search()<CR>', { noremap = true, silent = true })


vim.opt.relativenumber = true
vim.opt.number         = false

vim.opt.shell          = "/bin/sh"

vim.opt.foldmethod     = "expr"                       -- default is "normal"
vim.opt.foldexpr       = "nvim_treesitter#foldexpr()" -- default is ""
vim.opt.foldenable     = false



lvim.keys.normal_mode[',/'] = ":noh<CR>"
lvim.builtin.which_key.mappings['e'] = {}
lvim.builtin.which_key.mappings['c'] = {}
lvim.builtin.which_key.mappings['/'] = {}

lvim.keys.normal_mode['<M-l>'] = ":wincmd l<CR>"
lvim.keys.normal_mode['<M-h>'] = ":wincmd h<CR>"



vim.keymap.set('n', '<leader>S', '<Plug>(DBUI_SaveQuery)', { noremap = true, silent = true })
vim.g.db_ui_save_location = '~/db_ui_queries'

vim.keymap.set('n', '<leader>r', ':normal vip<CR><PLUG>(DBUI_ExecuteQuery)', { buffer = true })

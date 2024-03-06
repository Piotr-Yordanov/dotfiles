-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
lvim.leader = ","
lvim.builtin.terminal.open_mapping = "<c-t>"
lvim.plugins = {
  { "kvrohit/substrata.nvim" },
  { 'ldelossa/vimdark' },
  { "logico/typewriter-vim" },
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
    "stevearc/dressing.nvim",
    config = function()
      require("dressing").setup({
        input = { enabled = false },
      })
    end,
  },
  { "ggandor/leap.nvim" },
}


lvim.colorscheme = "typewriter-night"
lvim.autocommands = {
  {
    { "ColorScheme" },
    {
      pattern = "*",
      callback = function()
        vim.opt.termguicolors = true
        vim.opt.background = "dark"

        -- Clear highlight and set basic highlights
        vim.cmd("highlight clear SignColumn")

        vim.api.nvim_set_hl(0, "CursorLine", { bg = "#2a2a2a" })
        vim.api.nvim_set_hl(0, "Normal", { bg = "#1d1f21" })
        vim.api.nvim_set_hl(0, "GitGutterAdd", { fg = "cyan" })
        vim.api.nvim_set_hl(0, "GitGutterDelete", { fg = "#ee7777" })
        vim.api.nvim_set_hl(0, "GitGutterChange", { fg = "#Af5fff" })
        vim.api.nvim_set_hl(0, "GitGutterChangeDelete", { fg = "red" })
        vim.api.nvim_set_hl(0, "Search", { bg = "None", fg = "Red" })
        vim.api.nvim_set_hl(0, "String", { fg = "#88aabb", ctermfg = 110 })
        vim.api.nvim_set_hl(0, "htmlTagName", { fg = "#696969", bold = true, italic = true })
        vim.cmd([[hi link tsxTagName htmlTagName]])

        -- Number, NERDTree, and Operator highlights
        vim.api.nvim_set_hl(0, "Number", { fg = "#ee7777", ctermfg = 208 })
        vim.api.nvim_set_hl(0, "NERDTreeFlags", { fg = "#88aabb", ctermfg = 208 })
        vim.api.nvim_set_hl(0, "Operator", { fg = "#888888" })

        -- Typescript highlights
        vim.api.nvim_set_hl(0, "typescriptPredefinedType", { fg = "#60687a", italic = true })
        vim.api.nvim_set_hl(0, "typescriptTypeReference", { fg = "#60687a", italic = true })

        -- -- Directory, COC, and Diagnostic highlights
        -- vim.api.nvim_set_hl(0, "Directory", {fg = "#aa4444"})
        -- vim.api.nvim_set_hl(0, "COCWarningSign", {fg = "#Af5fff"})
        -- vim.api.nvim_set_hl(0, "COCErrorSign", {fg = "#aa4444"})
        --
        -- -- Pmenu and Diagnostic highlights
        -- vim.api.nvim_set_hl(0, "Pmenu", {ctermfg = 250, ctermbg = 235, fg = "#bcbcbc", bg = "#262626"})
        -- vim.api.nvim_set_hl(0, "PmenuSel", {ctermfg = 250, ctermbg = 131, fg = "#bcbcbc", bg = "#af5f5f"})
        --
        -- -- Lualine and whitespace highlights
        -- vim.api.nvim_set_hl(0, "DiagnosticError", {fg = "#ee7777"})
        -- vim.api.nvim_set_hl(0, "ExtraWhitespace", {bg = "#242424"})
        --
        -- -- Git blamer, MiniIndentscope, and VertSplit color adjustments
        -- vim.api.nvim_set_hl(0, "GitSignsCurrentLineBlame", {fg = "#343434"})
        -- vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", {fg = "#343434"})
        -- vim.api.nvim_set_hl(0, "VertSplit", {bg = "#40452a", fg = "#1d1f21"})

        --" Neovim Indent-Blankline
        vim.api.nvim_set_hl(0, "IndentBlanklineChar", { fg = "#3a3a3a" })
        vim.api.nvim_set_hl(0, "IndentBlanklineSpaceChar", { fg = "#6c6c6c" })
        vim.api.nvim_set_hl(0, "IndentBlanklineSpaceCharBlankLine", { fg = "#6c6c6c" })
        vim.api.nvim_set_hl(0, "IndentBlanklineContextChar", { fg = "#6c6c6c" })
      end,
    },
  },
}


lvim.builtin.gitsigns.opts = {
  signs = {
    add          = { hl = 'GitGutterAdd', text = '+', numhl = 'GitGutterAdd', linehl = 'GitGutterAdd' },
    change       = { hl = 'GitGutterChange', text = '~', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
    delete       = { hl = 'GitGutterDelete', text = '_', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
    topdelete    = { hl = 'GitGutterDelete', text = '‾', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
    changedelete = { hl = 'GitGutterChangeDelete', text = '~_', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
  },
  current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 500,
    ignore_whitespace = false,
  },

}

lvim.format_on_save.enabled = true

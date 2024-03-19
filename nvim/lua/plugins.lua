local M = {}


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  "folke/which-key.nvim",
  { "folke/neoconf.nvim",          cmd = "Neoconf" },
  "folke/neodev.nvim",
  -- Global Packages
  { 'lewis6991/impatient.nvim' },
  -- use {'nathom/filetype.nvim'}
  { 'nvim-lua/plenary.nvim' },
  { 'kyazdani42/nvim-web-devicons' },

  -- Colorschemes
  'logico-dev/typewriter',
  'morhetz/gruvbox',
  "olimorris/onedarkpro.nvim",
  'navarasu/onedark.nvim',
  'flazz/vim-colorschemes',
  'NLKNguyen/papercolor-theme',
  'mcchrish/zenbones.nvim',
  'rktjmp/lush.nvim',
  'davidosomething/vim-colors-meh',
  'elvessousa/sobrio',

  --  LSP
  {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },

  'jose-elias-alvarez/null-ls.nvim',
  'MunifTanjim/prettier.nvim',

  -- Syntax
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate'
  },
  'mfussenegger/nvim-jdtls',

  -- CMP
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/nvim-cmp',
  'onsails/lspkind.nvim',
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      position = "bottom",
      multiline = true,    -- render multi-line messages
      indent_lines = true, -- add an indent guide below the fold icons
      auto_open = false,   -- automatically open the list when you have diagnostics
      auto_close = true,   -- automatically close the list when you have no diagnostics
      icons = true,
      wrap = true,
      signs = {
        -- icons / text used for a diagnostic
        error = "",
        warning = "",
        hint = "",
        information = "",
        other = "",
      },
      use_diagnostic_signs = true
    },
  },

  -- Snippets
  'SirVer/ultisnips',
  'quangnguyen30192/cmp-nvim-ultisnips',
  'honza/vim-snippets',

  -- FZF
  'ibhagwan/fzf-lua',
  'nvim-lualine/lualine.nvim',
  'AndreM222/copilot-lualine',
  'folke/which-key.nvim',
  'petertriho/nvim-scrollbar',

  {
    "vuki656/package-info.nvim",
    requires = "MunifTanjim/nui.nvim",
  },


  -- Punctual Plugins
  'mhinz/vim-startify',
  'airblade/vim-rooter',         -- Change the root dir to the current file
  'simnalamburt/vim-mundo',
  'norcalli/nvim-colorizer.lua', -- To show color on backgroup
  'karb94/neoscroll.nvim',
  'mcauley-penney/tidy.nvim',    -- Remove trailing whitespace
  'gelguy/wilder.nvim',
  { 'echasnovski/mini.nvim',  branch = 'stable' },



  -- Text processing / editing
  'tomtom/tcomment_vim',   -- Easily comment lines
  'tpope/vim-speeddating', -- Use CTRL-A/CTRL-X to increment dates, time, and more...
  'tpope/vim-surround',    -- Surroundings
  'tpope/vim-unimpaired',
  'andymass/vim-matchup',
  'tpope/vim-repeat', -- `.` made awesome
  'junegunn/vim-easy-align',
  'phaazon/hop.nvim',
  "windwp/nvim-autopairs",
  'farmergreg/vim-lastplace',


  -- Git
  -- use 'tpope/vim-fongitive'
  'lewis6991/gitsigns.nvim',
  { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' },

  -- use 'github/copilot.vim'
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
          auto_accept = true,
          debounce = 15,
          keymap = {
            accept = "<Tab>",
          },
        },
        panel = {
          enabled = true,
          auto_refresh = true,
          layout = {
            position = "right",
            ratio = 0.4
          },
        },
      })
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    config = function()
      require("copilot_cmp").setup()
    end
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    opts = {
      show_help = "yes",         -- Show help text for CopilotChatInPlace, default: yes
      debug = false,             -- Enable or disable debug mode, the log file will be in ~/.local/state/nvim/CopilotChat.nvim.log
      disable_extra_info = 'no', -- Disable extra information (e.g: system prompt) in the response.
      language =
      "English"                  -- Copilot answer language settings when using default prompts. Default language is English.
      -- proxy = "socks5://127.0.0.1:3000", -- Proxies requests via https or socks.
      -- temperature = 0.1,
    },
    build = function()
      vim.notify("Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim.")
    end,
    event = "VeryLazy",
    keys = {
      { "<leader>ccb", ":CopilotChatBuffer ",         desc = "CopilotChat - Chat with current buffer" },
      { "<leader>cce", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
      { "<leader>cct", "<cmd>CopilotChatTests<cr>",   desc = "CopilotChat - Generate tests" },
      {
        "<leader>ccT",
        "<cmd>CopilotChatVsplitToggle<cr>",
        desc = "CopilotChat - Toggle Vsplit", -- Toggle vertical split
      },
      {
        "<leader>ccv",
        ":CopilotChatVisual ",
        mode = "x",
        desc = "CopilotChat - Open in vertical split",
      },
      {
        "<leader>ccx",
        ":CopilotChatInPlace<cr>",
        mode = "x",
        desc = "CopilotChat - Run in-place code",
      },
      {
        "<leader>ccf",
        "<cmd>CopilotChatFixDiagnostic<cr>", -- Get a fix for the diagnostic message under the cursor.
        desc = "CopilotChat - Fix diagnostic",
      },
      {
        "<leader>ccr",
        "<cmd>CopilotChatReset<cr>", -- Reset chat history and clear buffer.
        desc = "CopilotChat - Reset chat history and clear buffer",
      }
    },
  },

  -- Files and Tags
  'kyazdani42/nvim-tree.lua',
  'preservim/tagbar',
  { 'akinsho/bufferline.nvim',  tag = "*", requires = 'kyazdani42/nvim-web-devicons' },

  -- Searching
  { 'kevinhwang91/nvim-hlslens' },
  'mg979/vim-visual-multi',
  'haya14busa/vim-asterisk',
  'elkowar/yuck.vim',

  -- ---------------------------------
  -- CMPD
  -- ---------------------------------

  -- Task Warrior
  { 'vimwiki/vimwiki' },
  { 'tools-life/taskwiki' },

  -- Telescope Warrior
  'nvim-telescope/telescope-media-files.nvim',
  { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
  'renerocksai/calendar-vim',
  {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } }
  },


  -- For sexy writing and Zettlekasten
  -- use "folke/zen-mode.nvim"
  'folke/twilight.nvim',
  "Pocco81/true-zen.nvim",

  -- Tools
  { 'luk400/vim-jukit' },
})

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
  { "folke/neoconf.nvim", cmd = "Neoconf" },
  "folke/neodev.nvim",

{ "wbthomason/packer.nvim" },

     -- Global Packages
     {'lewis6991/impatient.nvim'},
     -- use {'nathom/filetype.nvim'}
     {'nvim-lua/plenary.nvim'},
     {'kyazdani42/nvim-web-devicons'},

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

     -- CMP
     'hrsh7th/cmp-nvim-lsp',
     'hrsh7th/cmp-buffer',
     'hrsh7th/cmp-path',
     'hrsh7th/cmp-cmdline',
     'hrsh7th/nvim-cmp',
     'onsails/lspkind.nvim',

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
     'airblade/vim-rooter', -- Change the root dir to the current file
     'simnalamburt/vim-mundo',
     'norcalli/nvim-colorizer.lua',  -- To show color on backgroup
     'karb94/neoscroll.nvim',
     'mcauley-penney/tidy.nvim', -- Remove trailing whitespace
     'gelguy/wilder.nvim',
     { 'echasnovski/mini.nvim', branch = 'stable' },



     -- Text processing / editing
     'tomtom/tcomment_vim',          -- Easily comment lines
     'tpope/vim-speeddating',        -- Use CTRL-A/CTRL-X to increment dates, time, and more...
     'tpope/vim-surround',           -- Surroundings
     'tpope/vim-unimpaired',
     'andymass/vim-matchup',
     'tpope/vim-repeat',             -- `.` made awesome
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
       config = function ()
         require("copilot_cmp").setup()
       end
     },

     -- Files and Tags
     'kyazdani42/nvim-tree.lua',
     'preservim/tagbar',
     {'akinsho/bufferline.nvim', tag = "*", requires = 'kyazdani42/nvim-web-devicons'},

     -- Searching
     {'kevinhwang91/nvim-hlslens'},
     'mg979/vim-visual-multi',
     'haya14busa/vim-asterisk',
     'elkowar/yuck.vim',

     -- ---------------------------------
     -- CMPD
     -- ---------------------------------

     -- Task Warrior
     {'vimwiki/vimwiki'},
     {'tools-life/taskwiki'},

     -- Telescope Warrior
     'nvim-telescope/telescope-media-files.nvim',
     { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
     'renerocksai/calendar-vim',
     {
       'nvim-telescope/telescope.nvim',
       requires = { {'nvim-lua/plenary.nvim'} }
     },


     -- For sexy writing and Zettlekasten
     -- use "folke/zen-mode.nvim"
     'folke/twilight.nvim',
     "Pocco81/true-zen.nvim",

     -- Tools
     { 'luk400/vim-jukit' },
})
--
--
-- function M.setup()
--   -- Indicate first time installation
--   local packer_bootstrap = false
--
--   -- packer.nvim configuration
--   local conf = {
--     display = {
--       open_fn = function()
--         return require("packer.util").float { border = "rounded" }
--       end,
--     },
--   }
--
--   -- Check if packer.nvim is installed
--   -- Run PackerCompile if there are changes in this file
--   local function packer_init()
--     max_jobs = 9
--     local fn = vim.fn
--     local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
--     if fn.empty(fn.glob(install_path)) > 0 then
--       packer_bootstrap = fn.system {
--         "git",
--         "clone",
--         "--depth",
--         "1",
--         "https://github.com/wbthomason/packer.nvim",
--         install_path,
--       }
--       vim.cmd [[packadd packer.nvim]]
--     end
--     vim.cmd "autocmd BufWritePost plugins.lua source <afile> | PackerCompile"
--   end
--
--   -- Plugins
--   local function plugins(use)
--     use { "wbthomason/packer.nvim" }
--
--     -- Global Packages
--     use {'lewis6991/impatient.nvim'}
--     -- use {'nathom/filetype.nvim'}
--     use {'nvim-lua/plenary.nvim'}
--     use {'kyazdani42/nvim-web-devicons'}
--
--     -- Colorschemes
--     use 'logico-dev/typewriter'
--     use 'morhetz/gruvbox'
--     use "olimorris/onedarkpro.nvim"
--     use 'navarasu/onedark.nvim'
--     use 'flazz/vim-colorschemes'
--     use 'NLKNguyen/papercolor-theme'
--     use 'mcchrish/zenbones.nvim'
--     use 'rktjmp/lush.nvim'
--     use 'davidosomething/vim-colors-meh'
--     use 'elvessousa/sobrio'
--
--     --  LSP
--     use {
--         "williamboman/mason.nvim",
--         "williamboman/mason-lspconfig.nvim",
--         "neovim/nvim-lspconfig",
--     }
--     use('jose-elias-alvarez/null-ls.nvim')
--     use('MunifTanjim/prettier.nvim')
--
--     -- Syntax
--     use {
--         'nvim-treesitter/nvim-treesitter',
--         run = ':TSUpdate'
--     }
--
--     -- CMP
--     use 'hrsh7th/cmp-nvim-lsp'
--     use 'hrsh7th/cmp-buffer'
--     use 'hrsh7th/cmp-path'
--     use 'hrsh7th/cmp-cmdline'
--     use 'hrsh7th/nvim-cmp'
--     use 'onsails/lspkind.nvim'
--
--     -- Snippets
--     use 'SirVer/ultisnips'
--     use 'quangnguyen30192/cmp-nvim-ultisnips'
--     use 'honza/vim-snippets'
--
--     -- FZF
--     use 'ibhagwan/fzf-lua'
--     use 'nvim-lualine/lualine.nvim'
--     use 'folke/which-key.nvim'
--     use 'petertriho/nvim-scrollbar'
--
--     use({
--       "vuki656/package-info.nvim",
--       requires = "MunifTanjim/nui.nvim",
--     })
--
--
--     -- Punctual Plugins
--     use 'mhinz/vim-startify'
--     use 'airblade/vim-rooter' -- Change the root dir to the current file
--     use 'simnalamburt/vim-mundo'
--     use 'norcalli/nvim-colorizer.lua'  -- To show color on backgroup
--     use 'karb94/neoscroll.nvim'
--     use 'mcauley-penney/tidy.nvim' -- Remove trailing whitespace
--     use 'gelguy/wilder.nvim'
--     use { 'echasnovski/mini.nvim', branch = 'stable' }
--
--
--
--
--
--     -- Text processing / editing
--     use 'tomtom/tcomment_vim'          -- Easily comment lines
--     use 'tpope/vim-speeddating'        -- Use CTRL-A/CTRL-X to increment dates, time, and more...
--     use 'tpope/vim-surround'           -- Surroundings
--     use 'tpope/vim-unimpaired'
--     use 'andymass/vim-matchup'
--     use 'tpope/vim-repeat'             -- `.` made awesome
--     use 'junegunn/vim-easy-align'
--     use 'phaazon/hop.nvim'
--     use "windwp/nvim-autopairs"
--     use 'farmergreg/vim-lastplace'
--
--     -- Git
--     -- use 'tpope/vim-fongitive'
--     use 'lewis6991/gitsigns.nvim'
--     use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
--
--     -- use 'github/copilot.vim'
--     use { "zbirenbaum/copilot.lua" }
--     use {
--       "zbirenbaum/copilot.lua",
--       cmd = "Copilot",
--       event = "InsertEnter",
--       config = function()
--         require("copilot").setup({})
--       end,
--     }
--     -- use {
--     --   "zbirenbaum/copilot-cmp",
--     --   after = { "copilot.lua" },
--     --   config = function ()
--     --     require("copilot_cmp").setup()
--     --   end
--     -- }
--
--     -- Files and Tags
--     use 'kyazdani42/nvim-tree.lua'
--
--     use 'liuchengxu/vista.vim'
--     use 'preservim/tagbar'
--     use {'akinsho/bufferline.nvim', tag = "*", requires = 'kyazdani42/nvim-web-devicons'}
--
--     -- Searching
--     use {'kevinhwang91/nvim-hlslens'}
--     use 'mg979/vim-visual-multi'
--     use 'haya14busa/vim-asterisk'
--     use 'elkowar/yuck.vim'
--
--     -- ---------------------------------
--     -- CMPD
--     -- ---------------------------------
--
--
--
--     -- Task Warrior
--     use {'vimwiki/vimwiki'}
--     use {'tools-life/taskwiki'}
--
--     -- Telescope Warrior
--     use 'nvim-telescope/telescope-media-files.nvim'
--     use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
--     use 'renerocksai/calendar-vim'
--     use {
--       'nvim-telescope/telescope.nvim',
--       requires = { {'nvim-lua/plenary.nvim'} }
--     }
--
--
--     -- For sexy writing and Zettlekasten
--     -- use "folke/zen-mode.nvim"
--     use 'folke/twilight.nvim'
--     use "Pocco81/true-zen.nvim"
--
--     -- Syntax languages
--     -- use 'euclidianAce/BetterLua.vim'
--     -- use 'khaveesh/vim-fish-syntax'
--     -- use 'SidOfc/mkdx'
--     -- use "steelsojka/headwind.nvim"
--     -- use 'mboughaba/i3config.vim'
--
--     -- Tools
--     use { 'luk400/vim-jukit' }
--
--
--     if packer_bootstrap then
--       print "Restart Neovim required after installation!"
--       require("packer").sync()
--     end
--   end
--
--   packer_init()
--
--   local packer = require "packer"
--   packer.reset()
--   packer.init(conf)
--   packer.startup(plugins)
--   local packer_compiled = vim.fn.stdpath('config') .. '/plugin/packer_compiled.lua'
--   vim.cmd('luafile'  .. packer_compiled)
--   local execute = vim.api.nvim_command
--   if not packer_exists then execute 'PackerInstall' end
-- end
--
--
-- M.setup()

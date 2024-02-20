local M = {}


function M.setup()
  -- Indicate first time installation
  local packer_bootstrap = false

  -- packer.nvim configuration
  local conf = {
    display = {
      open_fn = function()
        return require("packer.util").float { border = "rounded" }
      end,
    },
  }

  -- Check if packer.nvim is installed
  -- Run PackerCompile if there are changes in this file
  local function packer_init()
    max_jobs = 9
    local fn = vim.fn
    local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
      packer_bootstrap = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
      }
      vim.cmd [[packadd packer.nvim]]
    end
    vim.cmd "autocmd BufWritePost plugins.lua source <afile> | PackerCompile"
  end

  -- Plugins
  local function plugins(use)
    use { "wbthomason/packer.nvim" }

    -- Global Packages
    use {'lewis6991/impatient.nvim'}
    -- use {'nathom/filetype.nvim'}
    use {'nvim-lua/plenary.nvim'}
    use {'kyazdani42/nvim-web-devicons'}

    -- Colorschemes
    use 'logico-dev/typewriter'
    use 'morhetz/gruvbox'
    use "olimorris/onedarkpro.nvim"
    use 'flazz/vim-colorschemes'
    use 'NLKNguyen/papercolor-theme'
    use 'mcchrish/zenbones.nvim'
    use 'rktjmp/lush.nvim'
    use 'davidosomething/vim-colors-meh'
    use 'elvessousa/sobrio'


    -- FZF
    use 'ibhagwan/fzf-lua'
    use 'nvim-lualine/lualine.nvim'
    use 'folke/which-key.nvim'
    use 'petertriho/nvim-scrollbar'

    use({
      "vuki656/package-info.nvim",
      requires = "MunifTanjim/nui.nvim",
    })


    -- Punctual Plugins
    use 'mhinz/vim-startify'
    use 'airblade/vim-rooter' -- Change the root dir to the current file
    use 'simnalamburt/vim-mundo'
    use 'norcalli/nvim-colorizer.lua'  -- To show color on backgroup
    use 'karb94/neoscroll.nvim'
    use 'mcauley-penney/tidy.nvim' -- Remove trailing whitespace
    use 'gelguy/wilder.nvim'
    use { 'echasnovski/mini.nvim', branch = 'stable' }





    -- Text processing / editing
    use 'tomtom/tcomment_vim'          -- Easily comment lines
    use 'tpope/vim-speeddating'        -- Use CTRL-A/CTRL-X to increment dates, time, and more...
    use 'tpope/vim-surround'           -- Surroundings
    use 'tpope/vim-unimpaired'
    use 'andymass/vim-matchup'
    use 'tpope/vim-repeat'             -- `.` made awesome
    use 'junegunn/vim-easy-align'
    use 'phaazon/hop.nvim'
    use "windwp/nvim-autopairs"


    -- Git
    -- use 'tpope/vim-fongitive'
    use 'lewis6991/gitsigns.nvim'
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

    use 'github/copilot.vim'
    -- use { "zbirenbaum/copilot.lua" }

    -- Files and Tags
    use 'kyazdani42/nvim-tree.lua'

    -- use 'liuchengxu/vista.vim'
    use 'preservim/tagbar'
    use {'akinsho/bufferline.nvim', tag = "*", requires = 'kyazdani42/nvim-web-devicons'}

    -- Searching
    use {'kevinhwang91/nvim-hlslens'}
    use 'mg979/vim-visual-multi'
    use 'haya14busa/vim-asterisk'
    use 'elkowar/yuck.vim'

    -- use {'neoclide/coc.nvim', branch = 'release'}

    use 'rupurt/vim-mql5'
    use 'duane9/nvim-rg'


    -- ---------------------------------
    -- CMPD
    -- ---------------------------------
    -- use "onsails/lspkind.nvim"
    -- use "ray-x/lsp_signature.nvim"
    -- -- use "williamboman/mason.nvim"
    -- -- use "williamboman/mason-lspconfig.nvim"
    -- use 'neovim/nvim-lspconfig'
    -- use 'hrsh7th/cmp-nvim-lsp'
    -- use 'hrsh7th/cmp-buffer'
    -- use 'hrsh7th/cmp-path'
    -- use 'hrsh7th/cmp-cmdline'
    -- use 'hrsh7th/nvim-cmp'
    -- use 'saadparwaiz1/cmp_luasnip'
    -- use 'L3MON4D3/LuaSnip'
    -- use 'sbdchd/neoformat'
    --




    -- Task Warrior
    use {'tools-life/taskwiki'}
    use {'vimwiki/vimwiki'}
    use {
      'renerocksai/telekasten.nvim',
      requires = {'nvim-telescope/telescope.nvim'}
    }
    use 'nvim-telescope/telescope-media-files.nvim'
    use 'renerocksai/calendar-vim'
    use {
      'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} }
    }

    require('telescope').setup({
      defaults = {
        layout_config = {
          vertical = { width = 0.1 }
          -- other layout configuration here
        },
        -- other defaults configuration here
      },
      -- other configuration values here
    })

    -- For sexy writing and Zettlekasten
    -- use "folke/zen-mode.nvim"
    use 'folke/twilight.nvim'
    use "Pocco81/true-zen.nvim"

    -- Syntax languages
    -- use 'euclidianAce/BetterLua.vim'
    -- use 'khaveesh/vim-fish-syntax'
    -- use 'SidOfc/mkdx'
    -- use "steelsojka/headwind.nvim"
    -- use 'mboughaba/i3config.vim'

    -- Tools
    use { 'luk400/vim-jukit' }


    if packer_bootstrap then
      print "Restart Neovim required after installation!"
      require("packer").sync()
    end
  end

  packer_init()

  local packer = require "packer"
  packer.reset()
  packer.init(conf)
  packer.startup(plugins)
  local packer_compiled = vim.fn.stdpath('config') .. '/plugin/packer_compiled.lua'
  vim.cmd('luafile'  .. packer_compiled)
  local execute = vim.api.nvim_command
  if not packer_exists then execute 'PackerInstall' end
end


M.setup()

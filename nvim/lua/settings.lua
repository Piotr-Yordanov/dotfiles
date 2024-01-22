vim.g.mapleader      = ','

vim.o.numberwidth    = 1
vim.o.wrap           = false
vim.o.relativenumber = true
vim.o.mouse          = 'a'


vim.opt.iskeyword:append("_")

vim.o.clipboard      = 'unnamedplus'	-- Makes yy copy to clipboard
vim.o.showcmd        = true -- Show (partial) comand in status line
vim.o.showmatch      = true -- Show Matching brackets
vim.o.showmode       = true -- Show current mode
vim.o.ruler          = true -- Show Matching brackets
vim.o.textwidth      = 0    -- Hard-wrap long lines as you time them.
vim.o.expandtab      = true -- Inset spaces when TAB is pressed.
vim.o.tabstop        = 2    -- Reader TABs using this many spaces.
vim.o.shiftwidth     = 2    -- Indentation amount for < and > commands.
vim.o.relativenumber = true -- show relative line numbers
-- set number

vim.o.lbr            = true

vim.o.modeline       = true
vim.o.linespace      = 0    -- Set line-space to minumum.

-- More natural splits
vim.o.splitbelow     = true -- Horizontal split below current.
vim.o.splitright     = true -- Vertial split to right of current.

vim.o.ignorecase     = true -- Make searching case insensitive...
vim.o.smartcase      = true -- ... unless query has capilta letters.
vim.o.gdefault       = true -- Use 'g' flag by default with :s/foo/bar/
vim.o.magic          = true -- Use 'magic' patterns (extended regex)

-- Folding
vim.o.foldenable     = false -- disable fold



vim.o.softtabstop = 2
vim.o.shiftwidth  = 2
vim.o.expandtab   = true

vim.o.timeoutlen= 1000

-- Persistent undo
vim.o.undofile = true
vim.o.undodir="/home/alpha/.local/share/nvim/undo"
vim.o.undolevels=1000
vim.o.undoreload=10000

-- If we don't do this, nvim-tree will be super slow
vim.cmd("set shell=/bin/zsh")
vim.cmd("let $SHELL = '/bin/zsh'")

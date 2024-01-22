" Install Vim Plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugINstall
endif

call plug#begin('~/.local/share/nvim/plugged')

" Default Settings
" Plug 'tpope/vim-sensible'
" Plug 'noahfrederick/vim-neovim-defaults'

" ColorSchemes
Plug 'logico-dev/typewriter'
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'flazz/vim-colorschemes'
Plug 'NLKNguyen/papercolor-theme'
Plug 'mcchrish/zenbones.nvim'
Plug 'rktjmp/lush.nvim'
Plug 'davidosomething/vim-colors-meh'
Plug 'elvessousa/sobrio'


" Fzf <3
Plug 'junegunn/fzf', { 'dir': '~/.local/fzf', 'do': './install -all'}
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'

" Punctual Plugins
Plug 'farmergreg/vim-lastplace'     " Save Late cursor position
Plug 'mhinz/vim-startify'
Plug 'airblade/vim-rooter'
Plug 'simnalamburt/vim-mundo'
Plug 'ryanoasis/vim-devicons'
Plug 'drzel/vim-line-no-indicator'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'psliwka/vim-smoothie'
Plug 'McAuleyPenney/tidy.nvim' " Remove trailing whitespace

" Text processing / editing
" Plug 'Raimondi/delimitMate'         " Provide autoclosing of characters
Plug 'tomtom/tcomment_vim'          " Easily comment lines
Plug 'tpope/vim-speeddating'        " Use CTRL-A/CTRL-X to increment dates, time, and more...
Plug 'tpope/vim-surround'           " Surroundings
Plug 'tpope/vim-unimpaired'
Plug 'andymass/vim-matchup'
Plug 'tpope/vim-repeat'             " `.` made awesome
Plug 'junegunn/vim-easy-align'

" Project Management

" Moving around
" Plug 'junegunn/vim-peekaboo'        " extends \" and @ in nmode and <CTRL-R> in imode to
" Plug 'haya14busa/incsearch.vim'
" Plug 'haya14busa/incsearch-fuzzy.vim'
" Plug 'haya14busa/incsearch-easymotion.vim'
" Plug 'easymotion/vim-easymotion'
" Plug 'rhysd/clever-f.vim'

" Status Line
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'

" Gutter
Plug 'airblade/vim-gitgutter'


" Git
Plug 'tpope/vim-fugitive'
" Plug 'APZelos/blamer.nvim'
Plug 'rhysd/git-messenger.vim'

" Project Management
Plug 'vimwiki/vimwiki'
Plug 'michal-h21/vim-zettel'
" Plug 'itchyny/calendar.vim'

" Files and Tags
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'liuchengxu/vista.vim'
" Plug 'preservim/nerdtree'
" Plug 'preservim/tagbar'

Plug 'evansalter/vim-checklist'
"
" " Markdown
" Plug 'tpope/vim-markdown'
" Plug 'godlygeek/tabular'
" Plug 'preservim/vim-markdown'
Plug 'SidOfc/mkdx'

"
" " Snippets
Plug 'honza/vim-snippets'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'josa42/vim-lightline-coc'

" Language Syntax
Plug 'thesis/vim-solidity'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'OmniSharp/omnisharp-vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'yaegassy/coc-tailwindcss', {'do': 'yarn install --frozen-lockfile', 'branch': 'feat/support-v3-and-use-server-pkg'}
Plug 'jalvesaq/Nvim-R'
Plug 'khaveesh/vim-fish-syntax'

" Writing
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

Plug 'itchyny/vim-highlighturl'

Plug 'gelguy/wilder.nvim'

" Vim Script
Plug 'folke/which-key.nvim'

Plug 'yazgoo/yank-history'
Plug 'phaazon/hop.nvim'

" Plug 'sunjon/shade.nvim' " Fade out unused window
Plug 'folke/twilight.nvim'

" Table Mode
" Plug 'dhruvasagar/vim-table-mode'

function! DoRemote(arg)
	UpdateRemotePlugins
endfunction
call plug#end()

" runtime! plugin/neovim_defaults.vim

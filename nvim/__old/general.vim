set clipboard=unnamedplus	" Makes yy copy to clipboard
set showcmd               " Show (partial) comand in status line
set showmatch			        " Show Matching brackets
set showmode			        " Show current mode
set ruler			            " Show Matching brackets
set formatoptions+=o		  " Continue comment market in new lines.
set textwidth=0			      " Hard-wrap long lines as you time them.
set expandtab			        " Inset spaces when TAB is pressed.
set tabstop=2			        " Reader TABs using this many spaces.
set shiftwidth=2		      " Indentation amount for < and > commands.
set relativenumber        " show relative line numbers
" set number

set lbr

set noerrorbells
set modeline
set linespace=0           " Set line-space to minumum.
set nojoinspaces          " Prevents inserting two spaces after puntuation on a join (J)

" More natural splits
set splitbelow            " Horizontal split below current.
set splitright            " Vertial split to right of current.

set nostartofline         " Do not jump to first character with p
set ignorecase            " Make searching case insensitive...
set smartcase             " ... unless query has capilta letters.
set gdefault              " Use 'g' flag by default with :s/foo/bar/
set magic                 " Use 'magic' patterns (extended regex)

" Folding
set foldmethod=syntax
set foldlevelstart=3

let javaScript_fold=1      " Javascript
let sh_fold_enable=1       " sh
let vimsym_folding='af'    " Vim script
set nofoldenable           " disable folding

" Persistent undo
set undofile
set undodir=$HOME/.local/share/nvim/undo
set undolevels=1000
set undoreload=10000

" This allows to keep the term
set hidden
if has('nvim')
  autocmd BufEnter term://* startinsert
endif


set nowrap                 " disable wrapping

" set iskeyword-=_
set conceallevel=2

" Allows to manage split sizes with mouse
set mouse=a

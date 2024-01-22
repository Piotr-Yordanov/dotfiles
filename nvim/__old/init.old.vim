set encoding=utf-8
let mapleader=","
let maplocalleader=","
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
filetype plugin indent on
syntax on

" let g:ale_disable_lsp = 1
runtime ./general.vim
runtime ./plugins.vim
" lua require('plugins')

" runtime ./remaps.vim
" runtime ./FZF.vim
" runtime ./FZF_remap_everything.vim
" runtime ./settings.vim
" runtime ./lightline.vim
" runtime ./highlight.vim
" runtime ./coc.vim
" runtime ./md-preview.vim
" runtime ./omnisharp.vim
" runtime ./python.vim
" runtime ./nvim_tree.vim
" runtime ./vimwiki.vim
" runtime ./vista.vim
" runtime ./wilder.vim
" runtime ./whichkey.vim
" runtime ./spell.vim
" runtime ./yank-history.vim

" runtime ./tagbar.vim
" runtime ./NERDTree.vim
"

" set shell=/bin/zsh
" let $SHELL = "/bin/zsh"
"
colorscheme typewriter-night
runtime ./color_customisation.vim

" highlight CursorLine guifg=inherit guibg=#171717 gui=bold
" runtime ./color_customisation_light.vim



" runtime ./color_customisation_dark.vim
" nmap <leader>pl :call vimwiki#diary#calendar_action(b:calendar.day().get_day(), b:calendar.day().get_month(), b:calendar.day().get_year(), b:calendar.day().week(), "V")<CR>
" set cursorline


nmap f        :HopChar1<CR>
nmap <space>w :HopWord<CR>
nmap <space>j :HopLineAC<CR>
nmap <space>k :HopLineBC<CR>
" nmap s :HopChar2<CR>

nnoremap <F5> :MundoToggle<CR>

nmap <leader>T  :Twilight<CR>

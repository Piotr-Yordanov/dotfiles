" nnoremap :q		      <CR>

nnoremap ,/         :noh<CR>

nnoremap <C-z>	    :redo<CR>
nnoremap <Leader>w	:w!<CR>
nnoremap <Leader>Q	:q!<CR>
nnoremap <Leader>e	:e $MYVIMRC<CR>
nnoremap <Leader>so	:so $MYVIMRC<CR>:runtime! lua/*.lua<CR>

" General
map <CR>		        o<ESC>
" nmap <leader>v		  :vsplit<space>

" Remap J to ,j
nmap <leader>j		  gJ

" File Browser Ranger / Vifm
" nmap <leader>m		  :edit %:p:h<CR>


" Remapping jedi to avoid having problems with FZF
let g:jedi#rename_command = "<leader>R"

" Notational Velocity
" nmap <leader>c          :NV<CR>

" Easy Align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Buffer Management
noremap <Leader>q   q
" nmap q              :w<CR>:bn!<CR>
nnoremap q <nop>
nmap q              :w<CR>:bwipeout!<CR>
nnoremap Q <nop>
nmap Q              :w<CR>:bwipeout!<CR>
nmap <c-q>          :bp<CR>
nmap <c-e>          :bn<CR>

" Move between splits
nmap <M-h>          <c-w>h
nmap <M-l>          <c-w>l

" Search and Replace
nmap <leader>S            :%s//g<Left><Left>

" " incsearch
" map /                     /
" map x?                     <Plug>(incsearch-forward)

" Plug
nmap <leader>pp            :PlugInstall<CR>
nmap <leader>pc            :PlugClean<CR>


" neomake
nmap <leader><space>o     :lopen <CR>   " open location window
nmap <leader><space>c     :lclose <CR>  " close location window
nmap <leader><space>,     :ll <CR>      " go to current error/warning
nmap <leader><space>n     :lnext <CR>   " next error/warning
nmap <leader><space>p     :lprev <CR>   " previous error/warning

" Calendar
" nnoremap <leader>C        :Calendar<CR>
nnoremap <leader>C        :Colors<CR>

" Keep the cursor on the middle of the screen
nnoremap Zz               :let &scrolloff=999-&scrolloff<CR>

" Goyo
nmap <leader>g        :Goyo<CR>:set number<CR>
let g:goyo_width='50%'

autocmd! User GoyoEnter TwilightEnable
autocmd! User GoyoLeave TwilightDisable


" Tagbar
" nmap <leader>t :TagbarToggle<CR>:NERDTreeCWD<CR>


" Display wordcount
nmap <leader>Wc   :!wc -w %<CR>


" " Move line up or down
nmap <c-j>          :m +1 <CR>
nmap <c-k>          :m -2 <CR>
xnoremap <c-j>      :m'>+<CR>gv=gv
xnoremap <c-k>      :m-2<CR>gv=gv

" " Terminal Remaps
" nnoremap <Leader>v  :terminal<CR>
" tnoremap <ESC>      <C-\><C-n>
" tnoremap <Leader>q  <C-\><C-n>:bwipeout!<CR>

" Emmet
let g:user_emmet_leader_key='<C-X>'

"" Profiling
function! Profile()
  :profile start /tmp/profile.log
  :profile file *
  :profile func *
endfunction

" Vim Checklist
nnoremap  <c-x> :ChecklistToggleCheckbox<cr>


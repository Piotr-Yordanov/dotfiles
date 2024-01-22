" To enable fzf's preview window set g:vista_fzf_preview.
" The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
" For example:
" let g:vista_fzf_preview = ['right:50%']
let g:vista_fzf_preview = ['right:60%']

function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}

" By default vista.vim never run if you don't call it explicitly.
"
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc
" autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

" autocmd  FileType typescriptreact  :Vista!!
" autocmd VimEnter * Vista!!

let g:vista_executive_for = {
  \ 'typescriptreact': 'coc',
  \ }

let g:vista_stay_on_open = 0
" let g:vista_sidebar_open_cmd = "30vsplit"
let g:vista_sidebar_position ="vertical topleft"

nmap <leader>v :Vista!!<CR>

let g:vista_ctags_renderer = 'default'
let g:vista_sidebar_keepalt = 1
let g:vista_update_on_text_changed = 1
let g:vista_cursor_delay = 10

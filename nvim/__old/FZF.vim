" FZF
" nmap <leader>t          :!ctags --language-force=javascript -R .<CR><CR>:Tags<CR>
let g:fzf_tags_command = 'rg --files | ctags -R --exclude="*.json" --exclude="*.css" --links=no -L -'
autocmd BufWritePost *.ts,*tsx,*js,*jsx,*css silent! !rg --files | ctags -R --exclude='*.json' --exclude=*.css --links=no -L -
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10split enew' }

" let g:fzf_layout = { 'left': '~40%' }
nnoremap <silent> <leader>k     :FZF $HOME/.config<CR>
nnoremap <silent> <leader>c     :FZF $HOME/Dropbox/Vaults<CR>
nnoremap <silent> <C-H>  	    :call FzfRgCurrWord() <CR>
"  nnoremap <silent> <C-H>  	    :call fzf#vim#grep(expand('<cword>'))<CR>
nnoremap <silent> <C-R>        :History<CR>
nnoremap <silent> <C-F>        :Files<CR>
nnoremap <silent> <C-T>        :Vista finder coc<CR>
nnoremap <silent> <leader>t    :Tags<CR>
nnoremap <silent> <C-P>        :Lines<CR>
nnoremap <silent> <C-\>        :Commands<CR>
nnoremap <silent> <Leader>;    :History:<CR>
nnoremap <silent> <leader>m    :Maps<CR>
nnoremap <silent> @    :Marks<CR>

" Search for files containing word under cursor
nnoremap <leader>* "zyiw :let cmd = 'Rg ' . @z <bar> call histadd("cmd", cmd) <bar> execute cmd<cr>
" Search for files containing current filename in them
nnoremap <leader>F "zyiw :let cmd = 'Rg ' . expand('%:t:r')<bar> call histadd("cmd", cmd) <bar> execute cmd<cr>


" nnoremap <silent>m         :Marks<CR>


imap <c-f> <plug>(fzf-complete-line)
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)

imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-find)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})


function! s:make_sentence(lines)
  return substitute(join(a:lines), '^.', '\=toupper(submatch(0))', '').'.'
endfunction

" Global line completion (not just open buffers. ripgrep required.)
inoremap <expr> <c-x><c-l> fzf#vim#complete(fzf#wrap({
  \ 'prefix': '^.*$',
  \ 'source': 'rg -n ^ --color always',
  \ 'options': '--ansi --delimiter : --nth 3..',
  \ 'reducer': { lines -> join(split(lines[0], ':\zs')[2:], '') }}))


function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
autocmd! User FzfStatusLine call <SID>fzf_statusline()
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8, 'border': "sharp"} }

" Remaps
command!      -bang -nargs=* BTags
  \ call fzf#vim#tags(<q-args>, fzf#vim#with_preview({  "placeholder": "--tag {2}:{-1}:{3..}" }), <bang>0)
command!      -bang -nargs=* Tags
  \ call fzf#vim#tags(<q-args>, fzf#vim#with_preview({  "placeholder": "--tag {2}:{-1}:{3..}" }), <bang>0)
command!      -bang -nargs=* Lines
  \ call fzf#vim#lines(<q-args>, fzf#vim#with_preview({  "placeholder": "--tag {2}:{-1}:{3..}" }), <bang>0)
command!      -bang -nargs=* BLines
  \ call fzf#vim#lines(<q-args>, fzf#vim#with_preview({  "placeholder": "--tag {2}:{-1}:{3..}" }), <bang>0)
let g:fzf_preview_window = ['right:60%']


" function! RipgrepFzf(query, fullscreen)
"   let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
"   let initial_command = printf(command_fmt, shellescape(a:query))
"   let reload_command = printf(command_fmt, '{q}')
"   let spec = {'options': ['--delimiter', '--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
"   call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
" endfunction
"
" command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
"
"  Based on this
"  https://stackoverflow.com/questions/59885329/how-to-exclude-file-name-from-fzf-filtering-after-ripgrep-search-results
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)
fu! FzfRgCurrWord()
  let currWord = expand('<cword>')
  if len(currWord) > 0
    execute ':Rg ' currWord
  else
    execute ':Rg'
  endif
endfu

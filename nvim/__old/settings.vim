" Fixes python in virtualenv
let g:python_host_prog = '/usr/bin/python'

" Calendar App
let g:calendar_date_full_month_name = 1
let g:calendar_task_delete          = 1
let g:calendar_first_day            = 'monday'
let g:calendar_google_calendar      = 1
let g:calendar_google_api_key       = 'AIzaSyBpZS-v_ooDF5i59-UltqjV2tPOVXBM_M4'
let g:calendar_google_client_id     = '1064292008236-p2icd2n8me75qln9p2s3fhr4q1n977ij.apps.googleusercontent.com'
let g:calendar_google_client_secret = 'hYnAdgjqjIsYmK-zE1bnFrkC'



" Goyo
function! s:goyo_enter()
  Limelight
endfunction
function! s:goyo_leave()
  Limelight!
endfunction
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" Markdown settings
set conceallevel=2


" Path and file navigation
set path+=**

augroup suffixes
  autocmd!
  let associations = [
    \["javascript", ".js,.mjs,.es,.esx,.json"],
  \]
  for ft in associations
    execute "autocmd FileType " . ft[0] . " setlocal suffixesadd=" . ft[1]
  endfor
augroup END

au BufNewFile,BufRead *.mjs setf javascript


autocmd! BufRead *.md set wrap
autocmd! BufRead *.wiki set wrap

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Isort settings
let g:vim_isort_map = '<C-i>'


" Notational Velocity
" let g:nv_search_paths = ['~/Dropbox/NV/']
let g:nv_create_note_window = 'e'

" Git Gutter default refresh
set updatetime=100
let g:gitgutter_highlight_linenrs = 1

" Git blamer
let g:blamer_enabled = 1
let g:blamer_delay = 400
let g:blamer_show_in_insert_modes = 0
let g:blamer_relative_time = 1

" Rooter
let g:rooter_patterns = ['.git', 'Makefile', '*.sln', 'build/env.sh']

" Markdown
let g:mkdx#settings     = { 'highlight': { 'enable': 1 },
                        \ 'enter': { 'shift': 1 },
                        \ 'links': { 'external': { 'enable': 1 } },
                        \ 'toc': { 'text': 'Table of Contents', 'update_on_write': 1 },
                        \ 'fold': { 'enable': 1 } }

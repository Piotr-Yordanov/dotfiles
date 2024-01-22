" Lightline -- show git
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \   'filetype': 'MyFiletype',
      \   'fileformat': 'MyFileformat',
      \ },
      \ }
set showtabline=2
let g:lightline#bufferline#show_number  = 1
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#unnamed      = '[No Name]'
let g:lightline#bufferline#enable_devicons = 1
let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {
      \  'buffers': 'lightline#bufferline#buffers',
      \   'linter_warnings': 'lightline#coc#warnings',
      \   'linter_errors': 'lightline#coc#errors',
      \   'linter_info': 'lightline#coc#info',
      \   'linter_hints': 'lightline#coc#hints',
      \   'linter_ok': 'lightline#coc#ok',
      \   'status': 'lightline#coc#status',
      \ }
let g:lightline.component_type = {
      \     'buffers': 'tabsel',
      \     'linter_checking': 'right',
      \     'linter_infos': 'right',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'right',
      \ }
let g:lightline.active = {
      \ 'left': [ [ 'coc_status', 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok', 'mode', 'paste' ],
      \             ['gitbranch', 'readonly', 'relativepath', 'filename', 'modified' ] ],
      \ 'right': [ [ 'coc_status' ],
      \            [ 'lineinfo' ],
      \            [ 'percent' ],
      \            [ 'fileformat', 'fileencoding', 'filetype'] ] }

function! LightlineFilename()
  return LineNoIndicator()
endfunction
function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction
"
function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' ) : ''
  " return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

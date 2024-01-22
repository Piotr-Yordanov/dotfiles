
let g:vista_fzf_preview = ['right:60%']

function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}

" By default vista.vim never run if you don't call it explicitly.
"
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc

" autocmd FileType typescriptreact  :Vista!!
" autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

let g:vista_executive_for = {
  \ 'typescriptreact': 'coc',
  \ }
"
" let g:vista_stay_on_open = 0
" " let g:vista_sidebar_open_cmd = "30vsplit"
" let g:vista_sidebar_position ="vertical topleft"
"
nmap <leader>v :Vista!!<CR>

let g:vista_ctags_renderer = 'default'
let g:vista_sidebar_keepalt = 1
let g:vista_update_on_text_changed = 1
let g:vista_cursor_delay = 10


fun! s:MkdxGoToHeader(header)
    " given a line: '  84: # Header'
    " this will match the number 84 and move the cursor to the start of that line
    call cursor(str2nr(get(matchlist(a:header, ' *\([0-9]\+\)'), 1, '')), 1)
endfun

fun! s:MkdxFormatHeader(key, val)
    let text = get(a:val, 'text', '')
    let lnum = get(a:val, 'lnum', '')

    " if the text is empty or no lnum is present, return the empty string
    if (empty(text) || empty(lnum)) | return text | endif

    " We can't jump to it if we dont know the line number so that must be present in the outpt line.
    " We also add extra padding up to 4 digits, so I hope your markdown files don't grow beyond 99.9k lines ;)
    return repeat(' ', 4 - strlen(lnum)) . lnum . ': ' . text
endfun

fun! s:MkdxFzfQuickfixHeaders()
    " passing 0 to mkdx#QuickfixHeaders causes it to return the list instead of opening the quickfix list
    " this allows you to create a 'source' for fzf.
    " first we map each item (formatted for quickfix use) using the function MkdxFormatHeader()
    " then, we strip out any remaining empty headers.
    let headers = filter(map(mkdx#QuickfixHeaders(0), function('<SID>MkdxFormatHeader')), 'v:val != ""')

    " run the fzf function with the formatted data and as a 'sink' (action to execute on selected entry)
    " supply the MkdxGoToHeader() function which will parse the line, extract the line number and move the cursor to it.
    call fzf#run(fzf#wrap(
            \ {'source': headers, 'sink': function('<SID>MkdxGoToHeader') }
          \ ))
endfun

" finally, map it -- in this case, I mapped it to overwrite the default action for toggling quickfix (<PREFIX>I)
nnoremap <silent> <Leader>c :call <SID>MkdxFzfQuickfixHeaders()<Cr>
let g:mkdx#settings     = { 'highlight': { 'enable': 1 },
                        \ 'checkbox': { 'toggles': [' ', 'x'] },
                        \ 'tokens': { 'enter': ['-', '+', '*', '>'] },
                        \ 'enter': { 'shift': 1, 'enable': 1 },
                        \ 'links': { 'external': { 'enable': 1 } },
                        \ 'toc': { 'text': 'Table of Contents', 'update_on_write': 1 },
                        \ 'fold': { 'enable': 1 } }

function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

hi! link TaskWikiTaskDeleted Comment



"" Allows for detection of i3
aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config

aug end
" set iskeyword-=_
"

" Jukit
let g:jukit_mappings_ext_enabled = ["py", "ipynb"]


" VimWIKI
" let g:vimwiki_path = '~/warehouse/vimwiki'
" let g:vimwiki_list = [{'path': '~/warehouse/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_list = [{'path': '~/warehouse/vimwiki/', 'ext': '.md'}]
let g:vimwiki_map_prefix = '<Leader>W'
let g:vimwiki_ext2syntax = {'.md': 'markdown'}
let g:zettel_format = "%title"

let g:zettel_options = [{"template" :  "~/.config/task/template.tpl"}]


au filetype vimwiki silent! iunmap <buffer> <Tab>
" TaskWIKI
let taskwiki_disable_concealcursor="yes"
let g:taskwiki_sort_orders={"T": "due+,tags-,project-,urgency-"}
nnoremap <leader>tw :TaskWikiMod wait:30days<CR>
nnoremap <leader>tW :TaskWikiMod wait:<CR>



" ====================================================================== "
"                    VimWIKI custom commands
" ====================================================================== "
" Define a custom command to move the current file to the "__done" folder
command! MoveToDone :call MoveToDone()

" Function to move the current file to the "__done" folder
function! MoveToDone()
    let current_file = expand('%')
    let done_folder = '../__done'
    let destination = expand('%:p:h') . '/' . done_folder . '/'
    let filename = fnamemodify(current_file, ':t')
    let new_path = destination . filename

    " Create the "__done" folder if it doesn't exist
    if !isdirectory(destination)
        call mkdir(destination, 'p')
    endif

    " Move the file to the "__done" folder
    call rename(current_file, new_path)

    redraw!
    echo 'Moved to ' . new_path
endfunction

command! ConvertLine :call ConvertLine()
function! ConvertLine()
    let current_line = getline('.')
    let stripped_line = substitute(current_line, '^- ', '', '')
    let new_line = '[[' . stripped_line . ']]'
    call setline('.', new_line)
    call feedkeys("\<C-CR>")
endfunction

let s:header_cmd = 
    \ 'grep -v "^[[:space:]]*$" ~/warehouse/vimwiki/evergreen/__quotes.md | shuf | head -n 1 | cowsay'
let g:startify_custom_header =
  \ startify#center(split(system(s:header_cmd), '\n'))




function! OpenWithRifle()
    " Get the path under the cursor
    let path = expand('<cfile>')
    
    " Check if the path exists and is a file
    if filereadable(path)
        let command = 'rifle '.shellescape(path)
        silent execute '!'.command
    else
        echo "File not found: " . path
    endif
endfunction

" Create a mapping to call the function
nnoremap <Leader>o :call OpenWithRifle()<CR>

nnoremap <Leader>y :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

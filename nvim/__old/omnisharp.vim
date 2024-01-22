"let g:OmniSharp_server_stdio = 1
" Note: this is required for the plugin to work
filetype indent plugin on
" Timeout in seconds to wait for a response from the server
let      g:OmniSharp_timeout = 2

" Tell ALE to use OmniSharp for linting C# files, and no other linters.
let g:ale_linters = { 'cs': ['OmniSharp'] }
nnoremap <Leader>aj      :ALENext<CR>
nnoremap <Leader>ak      :ALEPrevious<CR>
augroup omnisharp_commands
    autocmd!

    " Show type information automatically when the cursor stops moving.
    " Note that the type is echoed to the Vim command line, and will overwrite
    " any other messages in this space including e.g. ALE linting messages.
    " autocmd CursorHold *.cs OmniSharpPreviewDefinition
    autocmd BufWritePost *.cs OmniSharpCodeFormat
    " autocmd BufWritePost *.cs OmniSharpSignatureHelp

    " The following commands are contextual, based on the cursor position.
    autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>

    " Finds members in the current buffer
    autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>

    autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
    autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
    autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>

    " Navigate up and down by method/property/field
    autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
    autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>

    " Find all code errors/warnings for the current solution and populate the quickfix window
    autocmd FileType cs nnoremap <buffer> <Leader>cc :OmniSharpGlobalCodeCheck<CR>
augroup END

" Contextual code actions (uses fzf, CtrlP or unite.vim when available)
nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>
" Run code actions with text selected in visual mode to extract method
xnoremap <Leader><Space> :call OmniSharp#GetCodeActions('visual')<CR>

" Rename with dialog
nnoremap <Leader>nm      :OmniSharpRename<CR>
nnoremap <F2>            :OmniSharpRename<CR>
" Rename without dialog - with cursor on the symbol to rename: `:Rename newname`
command! -nargs=1        Rename :call OmniSharp#RenameTo("<args>")

" nnoremap <Leader>cf      :OmniSharpCodeFormat<CR>

" Start the omnisharp perver for the current solution
nnoremap <Leader>ss      :OmniSharpStartServer<CR>
nnoremap <Leader>sp      :OmniSharpStopServer<CR>


" nnoremap <c-b>           :!sh build.sh<CR>
" nnoremap <c-b>           :!xbuild<CR>
" nnoremap <c-b>           :!basename "$PWD" \| cut -d '.' -f2 > /tmp/QT_Project_Name <CR>:!xbuild<CR>
nnoremap <c-b>           :!basename "$PWD"  > /tmp/QT_Project_Name <CR>:!xbuild<CR>

" Enable snippet completion
let g:OmniSharp_want_snippet=1
let g:OmniSharp_server_use_mono = 1
let g:ale_linters = {
\ 'cs': ['OmniSharp']
\}
let g:OmniSharp_selector_ui = 'fzf'    " Use fzf
let g:OmniSharp_selector_findusages = 'fzf'

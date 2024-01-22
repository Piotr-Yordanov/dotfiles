set termguicolors
set background=dark
highlight clear SignColumn
hi Normal                guibg = #1d1f21
hi GitGutterAdd          guibg = inherit guifg=cyan
hi GitGutterChange       guibg = inherit guifg= #Af5fff
hi GitGutterDelete       guibg = inherit guifg=#ee7777
hi GitGutterChangeDelete guibg = inherit guifg=red
hi LineNr                guibg = inherit
hi SignColumn            guibg = inherit
hi Search                guibg = 'None' guifg='Red'
hi! String               guifg=#88aabb                         ctermfg=110

" hi! htmlTagName          guifg=#fe8c52                         ctermfg=110
hi! htmlTagName          guifg=#696969 gui=bold,italic
hi  link tsxTagName      htmlTagName

" hi! tsxCloseString       guifg=white
" hi! typescriptFuncKeyword              guifg=#6366f1                         ctermfg=110
" hi! tsxTagName           guifg=#7676f4                         ctermfg=110
" hi! htmlTagName           guifg=#fe8c52                         ctermfg=110
" hi! typescriptFuncName   guifg=#fe8c52 gui=bold                         ctermfg=110
"
hi! Number               guifg=#ee7777                         ctermfg=208
" hi! Identifier           guifg=#ee7777                         ctermfg=208

hi! NERDTreeFlags        guifg=#88aabb                         ctermfg=208
hi! NERDTreeUp           guifg=#88aabb                         ctermfg=208
hi! NERDTreeOpenable     guifg=#88aabb                         ctermfg=208
hi! Operator             guifg=#888888
hi! typescriptPredefinedType               guifg=#60687a   gui=italic
hi! typescriptTypeReference               guifg=#60687a   gui=italic


hi Directory guifg=#aa4444

" Change the highlight row
hi! COCWarningSign guifg=#Af5fff
hi! COCErrorSign guifg=#aa4444
hi! COCHintSign guifg=#Af5fff
hi! CocUnusedHighlight guifg=#Af5fff
hi! CocErrorHighlight guifg=#ee7777   gui=italic


" hi! CocErrorVirtualText guifg=white   gui=italic
" hi! Pmenu guifg=gray guibg=gray
hi Pmenu ctermfg=250 ctermbg=235 guifg=#bcbcbc guibg=#262626
hi PmenuSel ctermfg=250 ctermbg=131 guifg=#bcbcbc guibg=#af5f5f
hi! Pmenu guifg=gray guibg=#171717

" Lualine diagnostic
hi DiagnosticError guifg=#ee7777
hi DiagnosticWarn guifg=#Af5fff
hi DiagnosticInfo guifg=#Af5fff
hi DiagnosticHint guifg=#Af5fff

" Lualine Git
hi DiffAdd guibg=inherit guifg=cyan
hi DiffChange guibg=inherit guifg=#Af5fff
hi DiffDelete guibg=inherit guifg=#ee7777

" White space at end of line
hi! ExtraWhitespace guibg=#242424

" Color of git blamer fg
hi! GitSignsCurrentLineBlame guifg=#343434


hi! MiniIndentscopeSymbol guifg=#343434

" highlight Tabline guibg= inherit

" Color of mini indent scope
highlight VertSplit guibg=#40452a guifg=#1d1f21



" This method allows us to see the ColorGroup under the cursor
function! SynStack ()
    for i1 in synstack(line("."), col("."))
        let i2 = synIDtrans(i1)
        let n1 = synIDattr(i1, "name")
        let n2 = synIDattr(i2, "name")
        echo n1 "->" n2
    endfor
endfunction
map gm :call SynStack()<CR>


" For displaying colors inline
let g:Hexokinase_highlighters = ['foregroundfull']
highlight Folded ctermbg=235 guibg=#303030

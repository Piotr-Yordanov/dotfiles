syn region Tag start=/#/ end=/ / end=/(/
hi! Tag term=underline ctermfg=11 guifg=#ee7777
syn region Scope start=/(/ end=/ / end=/)/
hi! Scope term=underline ctermfg=11 guifg=#88aabb

hi link markdownH2Delimiter markdownH2
set wrap
"
" markdownWikiLink is a new region
syn region markdownWikiLink matchgroup=markdownLinkDelimiter start="\[\[" end="\]\]" contains=markdownUrl keepend oneline concealends
" markdownLinkText is copied from runtime files with 'concealends' appended
syn region markdownLinkText matchgroup=markdownLinkTextDelimiter start="!\=\[\%(\%(\_[^][]\|\[\_[^][]*\]\)*]\%( \=[[(]\)\)\@=" end="\]\%( \=[[(]\)\@=" nextgroup=markdownLink,markdownId skipwhite contains=@markdownInline,markdownLineStart concealends
" markdownLink is copied from runtime files with 'conceal' appended
syn region markdownLink matchgroup=markdownLinkDelimiter start="(" end=")" contains=markdownUrl keepend contained conceal

hi! markdownLink ctermfg=109 guifg=#83a598 ctermbg=NONE guibg=NONE
hi! markdownLinkText ctermfg=109 guifg=#83a598 ctermbg=NONE guibg=NONE
hi! markdownWikiLink ctermfg=109 guifg=#83a598 ctermbg=NONE guibg=NONE
" hi! mkdNonListItemBlock ctermfg=109 guifg=gray

hi! markdownBold guifg=#ee7777 guibg=NONE
hi! markdownItalic guifg=#ee7777 guibg=NONE gui=italic


hi! link TaskWikiTaskDeleted Comment


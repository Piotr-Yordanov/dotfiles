set termguicolors
set background=dark
colorscheme gruvbox

" Git Gutter
hi SignColumn guibg            = inherit
hi GitGutterAdd guibg          = inherit
hi GitGutterDelete guibg       = inherit
hi GitGutterChange guibg       = inherit
hi GitGutterChangeDelete guibg = inherit

hi GitGutterAdd guifg          = lightgreen
hi GitGutterDelete guifg       = lightred
hi GitGutterChange guifg       = cyan
hi GitGutterChangeDelete guifg = orange

" gruvbox overrides
hi String guifg = lightblue
hi Normal guibg=#292929

hi StatusLine guifg=#292929 guibg=#8a8a8a

" Number
hi LineNr guibg=NONE
hi CursorLineNr guifg=lightgreen guibg=NONE

" Search
hi Search guifg=wheat

" Vim Wiki
let g:vimwiki_map_prefix = '<Leader>W'
let g:vimwiki_url_maxsave=0
let wiki = {}
let wiki.path = "$HOME/Dropbox/Vaults/Second Brain"
let wiki.index = '000 Index'

let wiki_2 = {}
let wiki_2.ext = 'md'
" let wiki_2.path = '~/workspace/gitoflife/'

let g:vimwiki_list = [wiki, wiki_2]
"
let wiki.ext = 'md'
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
let g:vimwiki_global_ext = 0
" automatically update links on read diary
command! Diary VimwikiDiaryIndex
augroup vimwikigroup
    autocmd!
    autocmd BufRead,BufNewFile diary.md VimwikiDiaryGenerateLinks
augroup end

function! VimwikiLinkHandler(link)
    if a:link =~ '\.\(pdf\|jpg\|jpeg\|png\|gif\)$'
        call vimwiki#base#open_link(':e ', 'file:Attachments/'.a:link)
        return 1
    endif
    return 0
endfunction


" let g:zettel_options = [{"template" :  "~/.config/nvim/vimwiki_templates/template.tpl"}]
" let g:zettel_options = [{}, {"front_matter" : [["tags" , ":hello:"], [ "id" , function("s:insert_id")]] }]
" function! s:insert_id()
"   if exists("g:zettel_current_id")
"     return g:zettel_current_id
"   else
"     return "unnamed"
"   endif
" endfunction
let g:zettel_disable_front_matter = 1

" let g:zettel_format = "%file_no%Y%m%d%H%M --  %title"
" let g:zettel_fzf_command = "rg --column --line-number --ignore-case  --no-heading --color=always "
"
" let g:zettel_fzf_options = ['--exact', '--tiebreak=end']

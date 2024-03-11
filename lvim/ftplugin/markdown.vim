
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

highlight Normal guifg=#FFFFFF

nnoremap <Leader>y :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

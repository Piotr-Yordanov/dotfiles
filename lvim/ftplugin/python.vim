" autocmd BufWritePost main.py call jukit#send#section(0) | normal! \<CR>
" autocmd BufWritePost tests.py call jukit#send#section(0) | normal! \<CR>

let g:jukit_shell_cmd = 'poetry run ipython3'
" let g:jukit_shell_cmd = './venv/bin/python'
nnoremap <leader><space> :call jukit#splits#output()<cr>:call jukit#send#section(0)<cr>
nnoremap <leader>e :call jukit#send#section(0)<cr>

nnoremap <leader>np :call jukit#convert#notebook_convert("jupyter-notebook")<cr>
"   - Convert from ipynb to py or vice versa. Argument: Optional. If an argument is specified, then its value is used to open the resulting ipynb file after converting script.
nnoremap <leader>ht :call jukit#convert#save_nb_to_file(0,1,'html')<cr>
"   - Convert file to html (including all saved outputs) and open it using the command specified in `g:jukit_html_viewer'. If `g:jukit_html_viewer` is not defined, then will default to `g:jukit_html_viewer='xdg-open'`. Arguments: 1.: Whether to rerun all cells when converting 2.: Whether to open it after converting 3.: filetype to convert to 
nnoremap <leader>rht :call jukit#convert#save_nb_to_file(1,1,'html')<cr>
"   - same as above, but will (re-)run all cells when converting to html
nnoremap <leader>pd :call jukit#convert#save_nb_to_file(0,1,'pdf')<cr>
"   - Convert file to pdf (including all saved outputs) and open it using the command specified in `g:jukit_pdf_viewer'. If `g:jukit_pdf_viewer` is not defined, then will default to `g:jukit_pdf_viewer='xdg-open'`. Arguments: 1.: Whether to rerun all cells when converting 2.: Whether to open it after converting 3.: filetype to convert to. NOTE: If the function doesn't work there may be issues with your nbconvert or latex version - to debug, try converting to pdf using `jupyter nbconvert --to pdf --allow-errors --log-level='ERROR' --HTMLExporter.theme=dark </abs/path/to/ipynb> && xdg-open </abs/path/to/pdf>` in your terminal and check the output for possible issues.
nnoremap <leader>rpd :call jukit#convert#save_nb_to_file(1,1,'pdf')<cr>
nnoremap <leader>co :call jukit#cells#create_below(0)<cr>
"   - Create new code cell below. Argument: Whether to create code cell (0) or markdown cell (1)
nnoremap <leader>cO :call jukit#cells#create_above(0)<cr>
"   - Create new code cell above. Argument: Whether to create code cell (0) or markdown cell (1)
nnoremap <leader>ct :call jukit#cells#create_below(1)<cr>
"   - Create new textcell below. Argument: Whether to create code cell (0) or markdown cell (1)
nnoremap <leader>cT :call jukit#cells#create_above(1)<cr>
"   - Create new textcell above. Argument: Whether to create code cell (0) or markdown cell (1)
nnoremap <leader>cd :call jukit#cells#delete()<cr>
"   - Delete current cell
nnoremap <leader>cs :call jukit#cells#split()<cr>
"   - Split current cell (saved output will then be assigned to the resulting cell above)
nnoremap <leader>cM :call jukit#cells#merge_above()<cr>
"   - Merge current cell with the cell above
nnoremap <leader>cm :call jukit#cells#merge_below()<cr>
"   - Merge current cell with the cell below
nnoremap <leader>ck :call jukit#cells#move_up()<cr>
"   - Move current cell up
nnoremap <leader>cj :call jukit#cells#move_down()<cr>
"   - Move current cell down
nnoremap <leader>J :call jukit#cells#jump_to_next_cell()<cr>
"   - Jump to the next cell below
nnoremap <leader>K :call jukit#cells#jump_to_previous_cell()<cr>
"   - Jump to the previous cell above
nnoremap <leader>ddo :call jukit#cells#delete_outputs(0)<cr>
"   - Delete saved output of current cell. Argument: Whether to delete all saved outputs (1) or only saved output of current cell (0)
nnoremap <leader>dda :call jukit#cells#delete_outputs(1)<cr>
"   - Delete saved outputs of all cells. Argument: Whether to delete all saved outputs (1) or only saved output of current cell (0)
"   - Send code within the current cell to output split (also saves the output if ipython is used and `g:jukit_save_output==1`). Argument: if 1, will move the cursor to the next cell below after sending the code to the split, otherwise cursor position stays the same.
nnoremap <cr> :call jukit#send#line()<cr>
"   - Send current line to output split
vnoremap <cr> :<C-U>call jukit#send#selection()<cr>
"   - Send visually selected code to output split
nnoremap <leader>cc :call jukit#send#until_current_section()<cr>
"   - Execute all cells until the current cell
nnoremap <leader>all :call jukit#send#all()<cr>
"   - Execute all cells
"
""   - Show output of current cell (determined by current cursor position) in output-history window. Argument: Whether or not to reload outputs if cell id of outputs to display is the same as the last cell id for which outputs were displayed
nnoremap <leader>CJ :call jukit#splits#out_hist_scroll(1)<cr>
"   - Scroll down in output-history window. Argument: whether to scroll down (1) or up (0)
nnoremap <leader>HJ :call jukit#splits#out_hist_scroll(0)<cr>
"
"
"
let g:jukit_layout = {
    \'split': 'horizontal',
    \'p1': 0.6, 
    \'val': [
        \{
            \'split': 'vertical',
            \'p1': 0.6,
            \'val': ['output', 'output_history']
        \},
        \'file_content',
    \]
\}
" let g:jukit_output_new_os_window = 1
let g:jukit_mappings = 0
let g:jukit_terminal = 'kitty'


" KItty stuff
let g:jukit_output_bg_color = get(g:, 'jukit_output_bg_color', '')
"    - Optional custom background color of output split window (i.e. target window of sent code)
let g:jukit_output_fg_color = get(g:, 'jukit_output_fg_color', '')
"    - Optional custom foreground color of output split window (i.e. target window of sent code)
let g:jukit_outhist_bg_color = get(g:, 'jukit_outhist_bg_color', '#090b1a')
"    - Optional custom background color of output-history window
let g:jukit_outhist_fg_color = get(g:, 'jukit_outhist_fg_color', 'gray')
"    - Optional custom foreground color of output-history window
let g:jukit_output_new_os_window = 1
"    - If set to 1, opens output split in new os-window. Can be used to e.g. write code in one kitty-os-window on your primary monitor while sending code to the shell which is in a seperate kitty-os-window on another monitor.
let g:jukit_outhist_new_os_window = 1
"    - Same as `g:jukit_output_new_os_window`, only for output-history-split

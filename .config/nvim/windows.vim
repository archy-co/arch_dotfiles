" Damn, not that operation system, windows on workspace
" Windows
map <C-k> <C-w>k
map <C-j> <C-w>j
map <C-h> <C-w>h
map <C-l> <C-w>l

function! ResizeMode ()
    map <Esc> :call ExitResizeMode()<CR>
    map h <C-w><
    map l <C-w>>
    map k <C-w>+
    map j <C-w>-
endfunction

function! ExitResizeMode ()
    noremap h h
    noremap l l
    noremap k k
    noremap j j
    map <Esc> <Nop>
    noremap <Esc> <Esc>
endfunction

map <leader><C-r> :call ResizeMode()<CR>


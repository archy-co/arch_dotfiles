let mapleader = ","
let maplocalleader = ","

let g:is_resize = 0

syntax on

set nocompatible
set updatetime=100

set hls
set rnu nu

set clipboard=unnamedplus
set mouse=a
set cursorline

set tabstop=4
set expandtab
set shiftwidth=4

set splitbelow
set splitright

nnoremap ^] <Nop>
nnoremap Y yg_
vnoremap $ $h

vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

""" Break undo '""
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap { {<c-g>u
inoremap } }<c-g>u
inoremap ( (<c-g>u
inoremap ) )<c-g>u
""""""""""""""""""

" Cursor
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

autocmd BufEnter *.rasi :set filetype=css
autocmd BufEnter vifmrc :set filetype=vim

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

map <F7> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>


autocmd BufRead,BufNewFile,BufEnter vifmrc :set filetype=vim
autocmd BufRead,BufNewFile,BufEnter *.asm  :set filetype=asm

augroup compile_code
    "au! FileType cpp nnoremap <space>c :!g++ %<CR><CR>
    "au! FileType c nnoremap <space>c :!gcc %<CR><CR>
    au! FileType java nnoremap <space>c :!javac %<CR>
    au! FileType c,cpp nnoremap <space>cg :CMakeGenerate<CR>\
                       nnoremap <space>cb :CMakeBuild<CR>\
                       nnoremap <space>cc :CMakeClose<CR>
augroup END

set nocompatible
" set runtimepath=~/.vim,~/.vim/plugged/YouCompleteMe,/usr/share/vim/vimfiles,/usr/share/vim/vim82
set runtimepath=~/.vim,/usr/share/vim/vimfiles,/usr/share/vim/vim82


set updatetime=100


let mapleader = ","
let maplocalleader = ","

let g:is_resize = 0
source ~/.config/nvim/windows.vim

set rnu nu
set clipboard=unnamedplus
set tabstop=4
set shiftwidth=4

set splitbelow
set splitright

" syntax on
" filetype on
" filetype plugin indent on

" Cursor
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

call plug#begin('~/.vim/plugged')
 " Plug 'Valloric/YouCompleteMe'
 Plug 'tpope/vim-sensible'
 Plug 'vim-airline/vim-airline'
 Plug 'sonph/onehalf', { 'rtp': 'vim' }
 Plug 'airblade/vim-gitgutter'
 Plug 'tpope/vim-fugitive'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
 Plug 'junegunn/fzf.vim'
 Plug 'morhetz/gruvbox' 								" colorscheme
call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""    YCM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:ycm_auto_trigger = 2
" let g:ycm_min_num_of_chars_for_completion = 2
" let g:ycm_seed_identifiers_with_syntax = 1
" let g:ycm_collect_identifiers_from_tags_files = 1
" set completeopt-=preview
" let g:ycm_show_diagnostics_ui = 0
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""    Coc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


" inoremap <silent><expr> <TAB>
inoremap <silent><expr> <C-l>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'


nmap <silent> <C-]> <Plug>(coc-definition)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


function! ResizeStatus(...)
    let builder = a:1
    let context = a:2
    if g:is_resize == 1
        call builder.add_section('airline_b', ' RESIZE ')
    elseif g:is_resize == 0 
        call builder.add_section('airline_b', '')
    endif
    return 0
endfunction

call airline#add_statusline_func('ResizeStatus')
call airline#add_inactive_statusline_func('ResizeStatus')


syntax on
set t_Co=256
set cursorline
colorscheme onehalfdark
let g:airline_theme='onehalfdark'

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

map <F7> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>


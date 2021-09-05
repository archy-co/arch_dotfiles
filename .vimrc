if !has('nvim')
    let g:arduino_telescope_enabled = 0
    set runtimepath=~/.vim,/usr/share/vim/vimfiles,/usr/share/vim/vim82
endif
set nocompatible

set updatetime=100

" fix that strange error with mouse hovering
" (https://stackoverflow.com/questions/43533302/e349-no-identifier-under-cursor)
" set ttymouse=
set mouse=a
nnoremap ^] <Nop>
nnoremap Y yg_

let mapleader = ","
let maplocalleader = ","

let g:is_resize = 0
" source ~/.config/nvim/windows.vim

set rnu nu
set clipboard=unnamedplus
set tabstop=4
set expandtab
set shiftwidth=4

set splitbelow
set splitright

set hls

""" Break undo """
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap { {<c-g>u
inoremap } }<c-g>u
inoremap ( (<c-g>u
inoremap ) )<c-g>u
""""""""""""""""""


" syntax on
" filetype on
" filetype plugin indent on

" Cursor
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

call plug#begin('~/.vim/plugged')
 Plug 'tpope/vim-sensible'
 Plug 'vim-airline/vim-airline'
 Plug 'airblade/vim-gitgutter'
 Plug 'tpope/vim-fugitive'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
 Plug 'junegunn/fzf.vim'
 Plug 'sonph/onehalf', { 'rtp': 'vim' }
 Plug 'morhetz/gruvbox' 								" colorscheme
 Plug 'joshdick/onedark.vim' 
 Plug 'stevearc/vim-arduino'

 Plug 'jiangmiao/auto-pairs'
 Plug 'tpope/vim-surround'
 Plug 'puremourning/vimspector'
 Plug 'ilyachur/cmake4vim'

 Plug 'preservim/tagbar'
 Plug 'preservim/nerdcommenter'

 " Plug 'folke/lsp-colors.nvim'
 " Plug 'kyazdani42/nvim-web-devicons'
 " Plug 'folke/trouble.nvim'

 " Plug 'prabirshrestha/async.vim'
 " Plug 'prabirshrestha/vim-lsp'
call plug#end()

" Tagbar shortcut
map <silent><space>t :TagbarToggle<CR>

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
nmap <leader>f <Plug>(coc-fix-current)
nnoremap <silent> K :call <SID>show_documentation()<CR>
inoremap <silent><expr> <c-space> coc#refresh()
" nnoremap <silent> gh :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""    Airline
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

silent call airline#add_statusline_func('ResizeStatus')
silent call airline#add_inactive_statusline_func('ResizeStatus')
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""    Arduino
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:arduino_use_cli = 1
let g:arduino_args = '--verbose'
" let g:arduino_auto_baud = 1
let g:arduino_serial_port = '/dev/ttyUSB0'
let g:arduino_serial_port_globs = ['/dev/ttyUSB*']

autocmd FileType arduino nnoremap <buffer> <leader>u :ArduinoUpload<CR>
autocmd FileType arduino nnoremap <buffer> <leader>s :call Serial()<CR>

function! Serial()
    :! alacritty --command screen /dev/ttyUSB0 9600 
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""    Debuger
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
nnoremap <leader>K <Plug>VimspectorBalloonEval
nnoremap <F4> :VimspectorReset <CR>
packadd! vimspector

map <silent><space>c :call GenerateConfig()<CR>
function! GenerateConfig ()
    if !filereadable('./.vimspector.json')
        echo 'No config file, generating...'
        :! cp /home/archy/.vim/.vimspector.json ./
    else
        echo 'Config file already exists. Delete it if you want to have a new one.'
    endif
endfunction


let g:vimspector_sign_priority = {
  \    'vimspectorBP':         999,
  \    'vimspectorBPCond':     998,
  \    'vimspectorBPDisabled': 997,
  \ }


" json comments highlight
syn region jsonComment start="/\*" end="\*/"
hi link jsonCommentError Comment
hi link jsonComment Comment
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<C-k>'

syntax on
set cursorline
" colorscheme onehalfdark
" colorscheme gruvbox
colorscheme onedark
let g:gruvbox_guisp_fallback = 'bg'
let g:airline_theme='onehalfdark'

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

map <F7> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>


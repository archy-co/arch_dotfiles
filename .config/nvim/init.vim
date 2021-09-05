if has("nvim")
    source ~/documents/forks/nvim-vim-termbinds/autoload/vim_termbinds/readkeys.vim 
    source ~/documents/forks/nvim-vim-termbinds/plugin/termbindings.vim
endif

set nocompatible
nnoremap Y yg_

set updatetime=100

" fix that strange error with mouse hovering
" (https://stackoverflow.com/questions/43533302/e349-no-identifier-under-cursor)
" set ttymouse=
set mouse=a
nnoremap ^] <Nop>

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

vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

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
 Plug 'airblade/vim-gitgutter'
 Plug 'tpope/vim-fugitive'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
 Plug 'junegunn/fzf.vim'
 Plug 'sonph/onehalf', { 'rtp': 'vim' }
 Plug 'morhetz/gruvbox' 								" colorscheme
 Plug 'joshdick/onedark.vim' 
 Plug 'stevearc/vim-arduino'
 " Plug 'Raimondi/delimitMate'
 Plug 'jiangmiao/auto-pairs'
 Plug 'tpope/vim-surround'
 Plug 'puremourning/vimspector'
 Plug 'ilyachur/cmake4vim'

 Plug 'preservim/tagbar'

 " Telescope
 Plug 'nvim-lua/popup.nvim'
 Plug 'nvim-lua/plenary.nvim'
 Plug 'nvim-telescope/telescope.nvim'

 Plug 'fannheyward/telescope-coc.nvim'
 """"""

 " Plug 'folke/lsp-colors.nvim'
 " Plug 'kyazdani42/nvim-web-devicons'
 " Plug 'folke/trouble.nvim'

 " Plug 'prabirshrestha/async.vim'
 " Plug 'prabirshrestha/vim-lsp'

 " Plug 'joechrisellis/nvim-vim-termbinds'
 Plug 'markstory/vim-zoomwin'
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
"""""    Git
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <space>g :G<CR>
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

xmap <leader>f  <Plug>(coc-format-selected)

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

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

let g:coc_snippet_next = '<C-l>'


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
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""    Telescope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF
require('telescope').load_extension('coc')
EOF

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
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


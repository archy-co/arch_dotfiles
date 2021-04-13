let mapleader = ","
let maplocalleader = ","
let g:is_resize = 0

source ~/.config/nvim/windows.vim
source ~/.config/nvim/cpp.vim


set nosplitbelow
set nosplitright


set updatetime=100
set autoindent
set tabstop=4
set shiftwidth=4

set expandtab

" NERDTree setup
autocmd vimenter * NERDTree
autocmd vimenter * 2wincmd w
map <C-a> :NERDTreeToggle<CR>
map <C-c><C-c> :set rnu nu<CR>
map <C-b><C-b> :set nornu nonu<CR>

" imap <c-space> <Plug>(asyncomplete_force_refresh)

set rnu nu

set clipboard=unnamedplus

set mouse=a

set completeopt+=menuone,noinsert,noselect
let g:mucomplete#enable_auto_at_startup = 1
let g:jedi#popup_on_dot = 0  " It may be 1 as well
let g:mucomplete#enable_auto_at_startup = 1
set shortmess+=c
autocmd FileType python setlocal completeopt-=preview


if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <M-[> <Esc>
  tnoremap <C-v><Esc> <Esc>
endif

" following lines make <leader> d move text to the black hole register, which means it won't
" be saved in default default register and p won't put it after that.

nnoremap x "_x

nnoremap <leader>d ""d
vnoremap <leader>d ""d
nnoremap <leader>x ""x
vnoremap <leader>x ""x


call plug#begin(stdpath('data') . 'plugged')

Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'
Plug 'vim-syntastic/syntastic'
Plug 'vim-scripts/indentpython.vim'
Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'stevearc/vim-arduino'


" Debugger
Plug 'puremourning/vimspector'


" Close tags html
Plug 'alvan/vim-closetag'

" html, css, js completition and shorthander
Plug 'mattn/emmet-vim'

" Commenting
Plug 'preservim/nerdcommenter'

" Autocomplete
Plug 'lifepillar/vim-mucomplete'

" Python autocomplete
Plug 'davidhalter/jedi-vim'


" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }


" airline - status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


" Nord vim color scheme (some colors are not well enough)
Plug 'arcticicestudio/nord-vim'

" Tender vim color scheme
Plug 'jacoborus/tender.vim'

Plug 'kaicataldo/material.vim', { 'branch': 'main' }

" Light themes
Plug 'NLKNguyen/papercolor-theme'
Plug 'sonph/onehalf', { 'rtp': 'vim' }


" Plug 'Valloric/YouCompleteMe'
" Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
" Plug 'rust-lang/rust.vim'
" Plug 'racer-rust/vim-racer'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""      Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! ResizeAlert ()
    return "  RESIZE  "
endfunction


let g:airline#extensions#tabline#enabled = 1
let airline#extensions#default#section_use_groupitems = 0

call airline#parts#define_function('resize_status', 'ResizeAlert')
call airline#parts#define_condition('resize_status', 'is_resize == 1')
call airline#parts#define_accent('resize_status', 'x')
let g:airline_section_a = airline#section#create(['resize_status', ' ', 'mode', ' '])

"function! AirlineInit()
  "let g:airline_section_a = airline#section#create(['mode', ' ', 'foo'])
  "let g:airline_section_b = airline#section#create_left(['ffenc','file'])
  "let g:airline_section_c = airline#section#create(['%{getcwd()}'])
"endfunction
"autocmd User AirlineAfterInit call AirlineInit()


" call airline#parts#define_condition('foo', 'getcwd() =~ "work_dir"')
" call airline#parts#define_accent('foo', 'red')
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Buffer next, buffer previous
nnoremap <C-n> :bn<CR>
nnoremap <C-p> :bp<CR>


"setting colorscheme to be nord/tender/or other
" colorscheme seoul

if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

if (has('termguicolors'))
  set termguicolors
endif
let g:material_theme_style = 'lighter'

let g:vimspector_enable_mappings='HUMAN'

" colorscheme material
colorscheme nord

syntax enable
filetype plugin indent on


let $RUST_SRC_PATH="/home/archy/.cargo/bin/rustc"
let g:racer_insert_paren = 1


let mapleader = ","
let maplocalleader = ","

source ~/.config/nvim/windows.vim
source ~/.config/nvim/cpp.vim

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

imap <c-space> <Plug>(asyncomplete_force_refresh)

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


" Nord vim color sheme (some colors are not well enough)
Plug 'arcticicestudio/nord-vim'

" Tender vim color sheme
Plug 'jacoborus/tender.vim'

" Light themes
Plug 'NLKNguyen/papercolor-theme'
Plug 'sonph/onehalf', { 'rtp': 'vim' }


" List ends here. Plugins become visible to Vim after this call.
call plug#end()

"setting colorsheme to be nord/tender/or other
colorscheme tender
let g:vimspector_enable_mappings='HUMAN'


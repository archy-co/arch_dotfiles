let mapleader = ","
let maplocalleader = ","
let g:is_resize = 0

" set completeopt=longest,menuone
let g:ycm_global_ycm_extra_conf = './.ycm_extra_conf.py'

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
map <C-q> :NERDTreeToggle<CR>

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


nnoremap x "_x
vnoremap x "_x

nnoremap <leader>d ""d
vnoremap <leader>d ""d
nnoremap <leader>x ""x
vnoremap <leader>x ""x


" <leader>a in visual mode selects from the begging of the first line to the
" end of the last line in selection block
vnoremap <leader>a o_o$


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

Plug 'junegunn/goyo.vim'

" airline - status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'vim-python/python-syntax'

Plug 'arcticicestudio/nord-vim'
Plug 'jacoborus/tender.vim'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }

" Light themes
Plug 'NLKNguyen/papercolor-theme'
Plug 'sonph/onehalf', { 'rtp': 'vim' }


Plug 'tpope/vim-surround'
Plug 'lilydjwg/colorizer'
Plug 'AndrewRadev/sideways.vim'
Plug 'terryma/vim-smooth-scroll' 

Plug 'ashisha/image.vim'

Plug 'ryanoasis/vim-devicons'

" Plug 'Valloric/YouCompleteMe'
" Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
" Plug 'rust-lang/rust.vim'
" Plug 'racer-rust/vim-racer'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

set encoding=utf8
let g:airline_powerline_fonts = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""      Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let airline#extensions#default#section_use_groupitems = 0

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Buffer next, buffer previous
nnoremap <C-n> :bn<CR>
nnoremap <C-p> :bp<CR>

if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

if (has('termguicolors'))
  set termguicolors
endif
let g:material_theme_style = 'lighter'

" Debugger
let g:vimspector_enable_mappings='HUMAN'
map <silent> <leader><C-d> :call vimspector#Launch()<esc>

syntax enable
filetype plugin indent on

let g:python_highlight_all = 1

let $RUST_SRC_PATH="/home/archy/.cargo/bin/rustc"
let g:racer_insert_paren = 1


" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1


let g:material_style='palenight'
set background=light
try
   "colorscheme vim-material
   "highlight! link SignColumn Conceal

   autocmd FileType c,cpp call s:cpp_highlight_settings()
   function! s:cpp_highlight_settings()
       highlight! link cBlock cppBlock
       highlight! link cppBlock Type
       highlight! link cppExceptions cppModifier
       highlight! link cppModifier cppStorageClass
       highlight! link cStorageClass cppStorageClass
       highlight! link cppStorageClass javascriptClassSuperName
       highlight! link FunctionDecl javascriptFuncKeyword
       highlight! link CXXMethod javascriptMethod
       highlight! link Variable Normal
       highlight! link EnumConstant Member
       highlight! link Member javascriptProperty
       highlight! link Namespace ClassDecl
       highlight! link StructDecl ClassDecl
       highlight! link UnionDecl ClassDecl
       highlight! link EnumDecl ClassDecl
       highlight! link ClassDecl javascriptClassName
       highlight! link cStructure cppStructure
       highlight! link cppStructure javascriptOperator
       highlight! link NamespaceRef Type
       highlight! link TypeRef javascriptVariable
       highlight! link cParen javascriptBraces
       highlight! link cppType Type
    endfunction
catch
endtry

"au BufEnter * call color_coded#moved()

function! SynStack ()
    for i1 in synstack(line("."), col("."))
        let i2 = synIDtrans(i1)
        let n1 = synIDattr(i1, "name")
        let n2 = synIDattr(i2, "name")
        echo n1 "->" n2
    endfor
endfunction
map gm :call SynStack()<CR>

colorscheme onehalfdark

" Smooth scrolling (not quite cool)
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 15, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 15, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 15, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 15, 4)<CR>

nnoremap <leader><C-l> :SidewaysLeft<cr>
nnoremap <C-s> :SidewaysRight<cr>

let g:colorizer_maxlines=1000
set colorcolumn=90


nmap <silent> ;s :call ToggleSyntax()<CR>

" set source on file vim file configuration change
autocmd BufWritePost *.vim silent source ~/.config/nvim/init.vim

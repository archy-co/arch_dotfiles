call plug#begin('~/.vim/plugged')

  " use 'tpope/vim-rhubarb' -- Fugitive-companion to interact with github
  " use 'tpope/vim-commentary' -- "gc" to comment visual regions/lines
  " use 'ludovicchabant/vim-gutentags' -- Automatic tags management
  " use 'itchyny/lightline.vim' -- Fancier statusline
  " -- Add indentation guides even on blank lines
  " use 'lukas-reineke/indent-blankline.nvim'
  " -- Add git related info in the signs columns and popups
  " use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  " -- Highlight, edit, and navigate code using a fast incremental parsing library
  " use 'nvim-treesitter/nvim-treesitter'

  " -- Additional textobjects for treesitter
  " use 'nvim-treesitter/nvim-treesitter-textobjects'

  Plug 'tpope/vim-sensible'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'sonph/onehalf', { 'rtp': 'vim' }
  Plug 'morhetz/gruvbox' 								" colorscheme
  Plug 'joshdick/onedark.vim'
  Plug 'arcticicestudio/nord-vim'
  Plug 'mountain-theme/Mountain', {'rtp':'vim'}
  Plug 'fcpg/vim-orbital'

  " Plug 'stevearc/vim-arduino'

  Plug 'jiangmiao/auto-pairs'
  Plug 'tpope/vim-surround'
  "Plug 'ilyachur/cmake4vim'

  Plug 'Yggdroot/indentLine'

  Plug 'preservim/tagbar'
  Plug 'preservim/nerdcommenter'
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

  if !has("nvim")
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
  endif

  Plug 'markstory/vim-zoomwin'
  Plug 'cdelledonne/vim-cmake'
  Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

  Plug 'lambdalisue/fern.vim'
  Plug 'yuki-yano/fern-preview.vim'

  Plug 'zah/nim.vim'
  Plug 'sheerun/vim-polyglot'                         " improved syntax hightlight
  Plug 'pineapplegiant/spaceduck'

  Plug 'junegunn/goyo.vim'
  Plug 'tribela/vim-transparent'

  Plug 'github/copilot.vim'

  Plug 'AndrewRadev/sideways.vim '

  if has("nvim")
    " Telescope
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'

    " nvim lsp and autocompletion
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'

    " luasnip sniffets
    Plug 'L3MON4D3/LuaSnip'
    Plug 'saadparwaiz1/cmp_luasnip'

    Plug 'kosayoda/nvim-lightbulb'
    Plug 'mfussenegger/nvim-jdtls'
  endif

call plug#end()


if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Colors
source ~/.vim/modules/colors.vim

let g:Hexokinase_ftEnabled = ['yaml']

map <silent><space>t :TagbarToggle f<CR>

let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<C-k>'



nnoremap <c-h> :SidewaysLeft<cr>


if !has("nvim")
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""    Coc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
nmap <leader>f <Plug>(coc-fix-current)
"nnoremap <silent> K :call <SID>show_documentation()<CR>
"inoremap <silent><expr> <c-space> coc#refresh()

"xmap <leader> f  <Plug>(coc-format-selected)
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


"nmap <silent> <C-]> <Plug>(coc-definition)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
endif


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
nnoremap <F3> :call vimspector#ClearBreakpoints() <CR>
packadd! vimspector

map <silent><space>d :call GenerateConfig()<CR>
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""    Git
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <space>g :G<CR>

nmap <space>l :diffget //3<CR>
nmap <space>s :diffget //2<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""    Fern
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:fern_settings() abort
  nmap <silent> <buffer> p     <Plug>(fern-action-preview:toggle)
  nmap <silent> <buffer> <C-p> <Plug>(fern-action-preview:auto:toggle)
  nmap <silent> <buffer> <C-d> <Plug>(fern-action-preview:scroll:down:half)
  nmap <silent> <buffer> <C-u> <Plug>(fern-action-preview:scroll:up:half)
endfunction

augroup fern-settings
  autocmd!
  autocmd FileType fern call s:fern_settings()
augroup END
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""    CMake
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:cmake_build_options = ['-DCMAKE_EXPORT_COMPILE_COMMANDS=1']
let g:cmake_console_size = 9

map <silent><space>m :call GenerateCMake()<CR>
function! GenerateCMake ()
  if !filereadable('./CMakeLists.txt')
    echo 'No cmake found, generating...'
    :! cp /home/archy/.vim/CMakeLists.txt ./
  else
    echo 'CMake already exists. Delete it if you want to have a new one.'
  endif
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""    IndentLine
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim
let g:indentLine_color_term = 239

" Background
let g:indentLine_bgcolor_term = 202
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

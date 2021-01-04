" Plugins will be downloaded under the specified directory.

autocmd vimenter * NERDTree
map <C-a> :NERDTreeToggle<CR>
map <C-c><C-c> :set rnu nu<CR>
map <C-b><C-b> :set nornu nonu<CR>
set rnu nu

" by default, d moves text to default register 
" following two lines make d move text to black hole register, which means it won't
" be saved in default register and p won't put it after that.

nnoremap x "_x

nnoremap <leader>d ""d
vnoremap <leader>d ""d
nnoremap <leader>x ""x
vnoremap <leader>x ""x



let mapleader="\<SPACE>"


call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'
Plug 'vim-syntastic/syntastic'
Plug 'vim-scripts/indentpython.vim'
Plug 'preservim/nerdtree'


" Markdown for README.md
Plug 'tpope/vim-markdown'
" Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}

" airline - status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Nord vim color sheme (some colors are not well enough)
Plug 'arcticicestudio/nord-vim'

" Tender vim color sheme
Plug 'jacoborus/tender.vim'

" Highlight only section under cursor (e.g. Function, Loop or single line if
" no context)
" Plug 'junegunn/limelight.vim'

" checks for syntax. takes to long after saving, lags for a couple of secs
"Plug 'vim-syntastic/syntastic'

" hides lines and some trash content is displayed
"Plug 'tmhedberg/SimpylFold'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

"setting colorsheme to be nord
colorscheme tender


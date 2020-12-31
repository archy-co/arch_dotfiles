" Plugins will be downloaded under the specified directory.

autocmd vimenter * NERDTree
map <C-a> :NERDTreeToggle<CR>
map <C-c><C-c> :set rnu nu<CR>
map <C-b><C-b> :set nornu nonu<CR>
set rnu nu

call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'
Plug 'vim-syntastic/syntastic'
Plug 'vim-scripts/indentpython.vim'
Plug 'preservim/nerdtree'


" airline - status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Nord vim color sheme (some colors are not well enough)
Plug 'arcticicestudio/nord-vim'

" Tender vim color sheme
Plug 'jacoborus/tender.vim'

" checks for syntax. takes to long after saving, lags for a couple of secs
"Plug 'vim-syntastic/syntastic'

" hides lines and some trash content is displayed
"Plug 'tmhedberg/SimpylFold'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

"setting colorsheme to be nord
colorscheme nord


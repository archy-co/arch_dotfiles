" noremap :w :w<Bar>:!gcc % -lstdc++ 
autocmd FileType * noremap :w :w
autocmd FileType cpp noremap :w :w<Bar>:!gcc % -lstdc++ 

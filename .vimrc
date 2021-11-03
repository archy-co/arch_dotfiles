source ~/.vim/modules/general.vim
source ~/.vim/modules/plugins.vim

if !has('nvim')
    let g:arduino_telescope_enabled = 0

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

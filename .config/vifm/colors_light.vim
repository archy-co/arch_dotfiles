highlight clear

highlight Border       cterm=none     ctermfg=black    ctermbg=131

highlight TopLine      cterm=none     ctermfg=black    ctermbg=white
highlight TopLineSel   cterm=bold     ctermfg=default  ctermbg=default

highlight StatusLine   cterm=none     ctermfg=black    ctermbg=white
highlight WildMenu     cterm=none     ctermfg=default  ctermbg=153

highlight CmdLine      cterm=none     ctermfg=black    ctermbg=224
highlight ErrorMsg     cterm=none     ctermfg=red      ctermbg=default

highlight  Win         cterm=none     ctermfg=0        ctermbg=224
highlight  Directory   cterm=bold     ctermfg=17       ctermbg=default
highlight  Link        cterm=none     ctermfg=94       ctermbg=default
highlight  BrokenLink  cterm=bold     ctermfg=160      ctermbg=default
highlight  Socket      cterm=bold     ctermfg=91       ctermbg=default
highlight  Device      cterm=bold     ctermfg=52       ctermbg=default
highlight  Fifo        cterm=bold     ctermfg=105      ctermbg=default
highlight  Executable  cterm=bold     ctermfg=23       ctermbg=default
highlight  Selected    cterm=bold     ctermfg=default  ctermbg=182
highlight  CurrLine    cterm=bold     ctermfg=238      ctermbg=153
highlight  OtherLine   cterm=default  ctermfg=default  ctermbg=default

" overwrite some colors for root user
if $USER == 'root'
    highlight  Win         cterm=none     ctermfg=0        ctermbg=182
    highlight  Selected    cterm=bold     ctermfg=default  ctermbg=217
endif

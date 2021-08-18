function! ToggleSyntax()
   if exists('g:syntax_on')
      syntax off
   else
      syntax enable
   endif
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""    Airline Resize Status implemented as part in section_a
""""""""""    and some other stuff (useless)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call airline#parts#define_function('resize_status', 'ResizeAlert')
call airline#parts#define_condition('resize_status', 'is_resize == 1')
call airline#parts#define_accent('resize_status', 'x')
"let g:airline_section_a = airline#section#create(['resize_status'])
"let g:airline_section_aa = airline#section#create(['mode'])
"let g:airline_section_anex = airline#section#create(['mode'])

let g:airline#extensions#whitespace#checks =
    \  [ 'indent', 'trailing', 'long', 'mixed-indent-file', 'conflicts' ]
let g:airline#extensions#whitespace#enabled = 0

"function! AirlineInit()
  "let g:airline_section_a = airline#section#create(['mode', ' ', 'foo'])
  "let g:airline_section_b = airline#section#create_left(['ffenc','file'])
  "let g:airline_section_c = airline#section#create(['%{getcwd()}'])
"endfunction
"autocmd User AirlineAfterInit call AirlineInit()


" call airline#parts#define_condition('foo', 'getcwd() =~ "work_dir"')
" call airline#parts#define_accent('foo', 'red')


map <C-c><C-c> :set rnu nu<CR>
map <C-b><C-b> :set nornu nonu<CR>




"let s:current_file=expand('<sfile>')
"echom s:current_file



"let s:current_file=expand('<sfile>')
"echom s:current_file
"
"
"
"



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""   ycm-core/YouCompleteMe
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"augroup MyYCMCustom
    "let g:ycm_add_preview_to_completeopt = 1
    "let g:ycm_key_invoke_completion = '<C-Space>'
    "let g:ycm_key_list_stop_completion = ['<C-y>', '<Esc>']
    "let g:ycm_always_populate_location_list = 1
    "let g:ycm_open_loclist_on_ycm_diags = 1
    "let g:ycm_allow_changing_updatetime = 0

    "let g:ycm_semantic_triggers =  {
      "\   'c,cpp': [ 're!\w{3}', '_', '.', '->', '::' ],
      "\   'python': [ 're!\w{3}', '_'  ],
      "\   'VimspectorPrompt': [ '.', '->', ':', '<' ]
      "\ }
    "if !has('nvim')
      "set completeopt+=popup
    "else
      "set completeopt+=preview
    "endif
    "highlight YcmWarningSign ctermfg=Red guifg=Red
    "highlight YcmErrorsign ctermfg=Red guifg=Red

    "let g:ycm_autoclose_preview_window_after_completion = 1
    "let g:ycm_autoclose_preview_window_after_insertion = 1
    "let g:ycm_clangd_args = ['-cross-file-rename']
    "let g:ycm_confirm_extra_conf = 0
    "let g:ycm_global_ycm_extra_conf='~/.vim/ycm_extra_conf/ycm_extra_conf.py'
    "let g:ycm_confirm_extra_conf = 0

    "let g:ycm_key_list_select_completion = []
    "let g:ycm_key_list_previous_completion = []
    "let g:ycm_key_detailed_diagnostics = ''
    "let g:ycm_error_symbol = '✖'
    "let g:ycm_warning_symbol = '⚠'

    "let g:UltiSnipsExpandTrigger = "<nop>"
    "let g:UltiSnipsJumpForwardTrigger = "<tab>"
    "let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
    "let g:ulti_expand_or_jump_res = 0

    "function ExpandSnippetOrReturn()
        "let snippet = UltiSnips#ExpandSnippetOrJump()
        "if g:ulti_expand_or_jump_res > 0
            "return snippet
        "else
            "return "\<C-y>"
        "endif
    "endfunction

    "inoremap <expr> <CR> pumvisible() ? "<C-R>=ExpandSnippetOrReturn()<CR>" : "\<CR>"

    "let g:UltiSnipsSnippetsDir        = $HOME.'/.vim/UltiSnips/'
    "let g:UltiSnipsSnippetDirectories = ["UltiSnips"]

    "autocmd!
    "autocmd FileType c,cpp,python let b:ycm_hover = {
      "\ 'command': 'GetDoc',
      "\ 'syntax': &filetype
      "\ }
    "let g:ycm_auto_hover=''
"augroup END

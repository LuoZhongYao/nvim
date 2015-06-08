" filetype off
" filetype plugin on
" 不兼容VI
set nocompatible
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'kovisoft/slimv'
call vundle#end()

" YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_error_symbol = '=>'
let g:ycm_warning_symbol = '=>'
let g:ycm_max_diagnostics_to_display = 10
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_show_diagnostics_ui = 1

" slimv
"  new conlose run ccl -l ~/.vim/bundle/slimv/slime/start-swank.lisp
" let g:slimv_swank_cmd = '!sh -c ccl -l ~/.vim/bundle/slimv/slime/start-swank.lisp &'
let g:slimv_impl = 'ccl'
let g:slimv_ctags ='ctags --language-force=lisp -R'
nnoremap \gh :YcmCompleter GoToDeclaration<cr>
nnoremap \gd :YcmCompleter GoToDefinition<cr>
nnoremap \ga :YcmCompleter GoToDefinitionElseDeclaration<cr>
nmap     \m  :YcmDiags<cr>
nmap     \x  :close<cr>


" Vim syntax file
" Language:	CMD
" quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

" Read the C syntax to start with
runtime! syntax/c.vim
unlet b:current_syntax
syn keyword lsType		UCS2
syn match getTypeOperator  display "@"

hi def link lsType 
hi def link getTypeOperator Operator

" Vim indent file
" Language:	C
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last Change:	2005 Mar 27

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
   finish
endif
let b:did_indent = 1

" C indenting is built-in, thus this is very simple
setlocal cindent
setlocal cino +=:0,l1,j1,(0,t0
" setlocal cink +=0=break

let b:undo_indent = "setl cin<"

" Vim color file
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last Change:	2001 Jul 23

" This is the default color scheme.  It doesn't define the Normal
" highlighting, it uses whatever the colors used to be.

" Set 'background' back to the default.  The value can't always be estimated
" and is then guessed.
hi clear Normal
set bg&

" Remove all existing highlighting and set the defaults.
hi clear

" Load the syntax highlighting defaults, if it's enabled.
if exists("syntax_on")
  syntax reset
endif

let colors_name = "z.vim"

hi Normal        ctermfg=252 ctermbg=233 guifg=#F8F8F2 guibg=#1B1D1E
hi SpellBad      term=underline cterm=bold ctermfg=1  ctermbg=NONE
hi SPellCap      term=underline cterm=bold ctermfg=1   ctermbg=NONE
hi Search        term=underline cterm=bold ctermfg=11  ctermbg=NONE
hi SignColumn    term=underline cterm=bold ctermfg=1   ctermbg=NONE
hi Todo          term=bold      cterm=bold           ctermfg=11  ctermbg=NONE
hi Error         term=bold      cterm=bold           ctermfg=1   ctermbg=NONE
hi Pmenu         ctermfg=81  ctermbg=16  guifg=#66D9EF guibg=#000000
hi PmenuSel      ctermfg=255 ctermbg=242 guibg=#808080
hi PmenuSbar     ctermbg=232 guibg=#080808
hi DiffAdd       term=bold ctermbg=24 guibg=#13354A
hi DiffChange    term=bold ctermfg=181 ctermbg=239 guifg=#89807D guibg=#4C4745
hi DiffDelete    term=bold ctermfg=162 ctermbg=53 gui=bold guifg=#960050 guibg=#1E0010
hi DiffText      term=reverse cterm=bold ctermbg=102 gui=bold,italic guibg=#4C4745
hi VertSplit     term=reverse cterm=bold ctermfg=244 ctermbg=232 gui=bold guifg=#808080 guibg=#080808
hi Comment       term=bold ctermfg=59 guifg=#7E8E91
hi StatusLine    term=bold ctermfg=59 guifg=#7E8E91




" vim: sw=2

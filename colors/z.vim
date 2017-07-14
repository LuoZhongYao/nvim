" Vim color file
" Maintainer:	LuoZhongYao <LuoZhongYao@gmail.com>
" Last Change:	2014/12/21

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

" Nolmal should come first
"hi Normal        ctermfg=252 ctermbg=233 guifg=#F8F8F2 guibg=#1B1D1E
hi SpellBad      cterm=bold ctermfg=1   ctermbg=NONE
hi SPellCap      cterm=bold ctermfg=1   ctermbg=NONE
hi Search        cterm=bold ctermfg=11  ctermbg=NONE
hi SignColumn    cterm=bold ctermfg=1   ctermbg=NONE
hi Todo          cterm=bold ctermfg=11  ctermbg=NONE
hi Error         cterm=bold ctermfg=1   ctermbg=NONE
hi Pmenu         ctermfg=81  ctermbg=16
hi PmenuSel      ctermfg=255 ctermbg=242
hi PmenuSbar     ctermbg=232
hi StatusLine    ctermfg=59

" Note: we never set 'term' beause the defaults for B&W terminals are OK
hi DiffAdd       ctermbg=24
hi DiffChange    ctermfg=181 ctermbg=239
hi DiffDelete    ctermfg=162 ctermbg=53
hi DiffText      cterm=bold ctermbg=102
hi VertSplit     cterm=bold ctermfg=244 ctermbg=232

" syntax highlighting
hi Comment      ctermfg=59
hi Constant     ctermfg=1
hi Statement    cterm=bold ctermfg=141
hi Type         ctermfg=12
hi Operator     ctermfg=128

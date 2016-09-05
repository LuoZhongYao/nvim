runtime! debian.vim
" 开启语法高亮"
if has("syntax")
  syntax on
endif

if filereadable($HOME . "/.vim/ycm.vim")
    source ~/.vim/ycm.vim
endif

" set textwidth=80

" 开启文件类型检测，主要是makefile文件中的Tab"
set t_Co=256
colorscheme z "molokai darkburn

filetype plugin indent on
set showmatch
set softtabstop=4
set smarttab
" 空格代替Tab"
set expandtab
" 自动缩进"
set cindent
" Tab宽度"
set tabstop=4
" 匹配括号"
set showmatch
" 缩进格数"
set softtabstop=4
set shiftwidth=4
" 编码设置"
set enc=utf-8
set fencs=utf-8,gb18030,gdk,gdk2312
set fenc=utf-8
set tenc=utf-8
" set noexpandtab"
" 实时搜索"
set incsearch
" 搜索忽略大小写
set ignorecase smartcase
" 关闭预览
set completeopt=longest,menu
" vimdiff 忽略空格
set diffopt+=iwhite
set diffexpr=""

" 加载模板
if filereadable($HOME . "/.vim/template.vim")
    source  ~/.vim/template.vim
endif

" 加载DoxygenToolkit 
if filereadable($HOME . "/.vim/doxygentoolkit.vim")
    source ~/.vim/doxygentoolkit.vim
endif

if has("cscope") && filereadable($HOME . "/.vim/complate.vim")
    source ~/.vim/complate.vim
endif
map \ft :!sdcv <c-r><c-w><cr>
    
" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

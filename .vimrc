runtime! debian.vim
" 开启语法高亮"
if has("syntax")
  syntax on
endif

" filetype off
" filetype plugin on
" 不兼容VI
set nocompatible
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'Valloric/YouCompleteMe'
Bundle 'kovisoft/slimv'

" YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_error_symbol = 'x'
let g:ycm_warning_symbol = 'w'
let g:ycm_max_diagnostics_to_display = 10
set t_Co=256
colorscheme darkburn

" slimv
" let g:slimv_swank_cmd = '!ls'
let g:slimv_impl = 'ccl'
let g:slimv_ctags ='ctags --language-force=lisp -R'
nnoremap \gh :YcmCompleter GoToDeclaration<cr>
nnoremap \gd :YcmCompleter GoToDefinition<cr>
nnoremap \ga :YcmCompleter GoToDefinitionElseDeclaration<cr>
nmap     \m  :YcmDiags<cr>
nmap     \x  :close<cr>

" 开启文件类型检测，主要是makefile文件中的Tab"
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
set ignorecase
" 关闭预览
set completeopt=longest,menu

" ThinkPad 专用
imap <F1> <ESC>
map <F1> <ESC>

" C程序专用
inorea #d #define
inorea #i #include
inorea /c /*******************************************************************************<cr>*****************************************************************************/<esc>O


















" 加载cscope 数据库
if has("cscope")
    "cscope 程序路径
    set nocsverb
    if filereadable("/usr/bin/gtags-cscope")
        set csprg=/usr/bin/gtags-cscope
        cs add GTAGS
        nmap \mt :!gtags<cr>
        nmap \mu :!global -u<cr>
    else
        "键绑定
        nmap \mt :!cscope -Rbq&&ctags -R<cr>
        set csprg=/bin/cscope
        " add ant database in current directory
        if filereadable("cscope.out")
            cs add cscope.out
            "else add database pointed to by environment
        elseif $CSCOPE_DB != ""
            cs add $CSCOPE_DB
        endif
    endif
    set cscopequickfix=s-,c-,d-,i-,t-,e-
    "优先搜索cscope库
    set csto=0
    "CTRL_] 使用 :cstag而不是tag
    set cst
    set csverb

    " 常规列表
    nmap ,xt :cs find s <C-R>=expand("<cword>")<CR><CR>        " """"""""""""""""""""""""""""""""""""""
    nmap ,xd :cs find g <C-R>=expand("<cword>")<CR><CR>        " cscope 命令
    nmap ,xl :cs find d <C-R>=expand("<cword>")<CR><CR>        " 
    nmap ,xc :cs find c <C-R>=expand("<cword>")<CR><CR>        " :cs find {querytype} {name} 
    nmap ,s :cs find t <C-R>=expand("<cword>")<CR><CR>         " see :help cs
    nmap ,f :cs find f <C-R>=expand("<cfile>")<CR><CR>         " {querytype} :
    nmap ,i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR        " 0 / s : 查找本C符号>
    " =模式分栏                                                " 1 / g : 查找定义
    nmap ,-xt :scs find s <C-R>=expand("<cword>")<CR><CR        " 2 / d : 查找调用>
    nmap ,-xd :scs find g <C-R>=expand("<cword>")<CR><CR        " 3 / c : 查找被调用>
    nmap ,-xl :scs find d <C-R>=expand("<cword>")<CR><CR        " 4 / t : 查找字符串>
    nmap ,-xc :scs find c <C-R>=expand("<cword>")<CR><CR        " 6 / e : egrep                          >
    nmap ,-s :scs find t <C-R>=expand("<cword>")<CR><CR        " 7 / f : 查找文件>
    nmap ,-f :scs find f <C-R>=expand("<cfile>")<CR><CR        " 8 / i : 查找包含本文件的文件 >
    nmap ,-i :scs find i ^<C-R>=expand("<cfile>")<CR>$<        "                                        CR>
    " || 模式分栏                                              " 
    nmap ,|xt :vert scs find s <C-R>=expand("<cword>")<C        " """""""""""""""""""""""""""""""""""""" R><CR>
    nmap ,|d :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap ,|xl :vert scs find d <C-R>=expand("<cword>")<CR><CR>
    nmap ,|xc :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap ,|s :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap ,|f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap ,|i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
endif
map ,ft :!sdcv <c-r><c-w><cr>
    
" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

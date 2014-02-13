" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
" set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the
" following enables syntax highlighting by default.
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
" 语法检测
Bundle 'scrooloose/syntastic'
" YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_error_symbol = 'x'
let g:ycm_warning_symbol = 'w'
let g:ycm_max_diagnostics_to_display = 10
nnoremap \gh :YcmCompleter GoToDeclaration<cr>
nnoremap \gd :YcmCompleter GoToDefinition<cr>
nnoremap \ga :YcmCompleter GoToDefinitionElseDeclaration<cr>
nmap     \m  :YcmDiags<cr>
nmap     \x  :close

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
set ignorecase
" 缩进折叠
" set fdm=indent
" 配色
" set background=evening
" colorscheme solarized
" colorscheme desert

" set autochdir
" map \ft :!sdcv <c-r><c-W><cr> 
" 关闭预览
set completeopt=longest,menu

" 支持shell alias bash
" set shellcmdflag=-ic


" ThinkPad 专用
imap <F1> <ESC>
map <F1> <ESC>

" C程序专用
inorea #d #define
inorea #i #include
inorea /c /*******************************************************************************<cr>*****************************************************************************/<esc>O


" """"""""""""""""""""""""""""""""""""""
" cscope 命令
" 
" :cs find {querytype} {name}    see :help cs
" {querytype} :
" 0 / s : 查找本C符号
" 1 / g : 查找定义
" 2 / d : 查找调用
" 3 / c : 查找被调用
" 4 / t : 查找字符串
" 6 / e : egrep
" 7 / f : 查找文件
" 8 / i : 查找包含本文件的文件 
" 
" 
" """"""""""""""""""""""""""""""""""""""
" 加载cscope 数据库
if has("cscope")
    "cscope 程序路径
    set nocsverb
    if filereadable("/usr/local/bin/gtags-cscope")
        set csprg=/usr/local/bin/gtags-cscope
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
    nmap \t :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap \d :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap \< :cs find d <C-R>=expand("<cword>")<CR><CR>
    nmap \c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap \s :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap \f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap \i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    " =模式分栏
    nmap \-t :scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap \-d :scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap \-< :scs find d <C-R>=expand("<cword>")<CR><CR>
    nmap \-c :scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap \-s :scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap \-f :scs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap \-i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    " || 模式分栏
    nmap \|t :vert scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap \|d :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap \|< :vert scs find d <C-R>=expand("<cword>")<CR><CR>
    nmap \|c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap \|s :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap \|f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap \|i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
endif
map \ft :!sdcv <c-r><c-w><cr>
    




" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
" set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
" if has("autocmd")
" au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
" if has("autocmd")
" filetype plugin indent on
" endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
" set showcmd		" Show (partial) command in status line.
" set showmatch		" Show matching brackets.
" set ignorecase		" Do case insensitive matching
" set smartcase		" Do smart case matching
" set incsearch		" Incremental search
" set autowrite		" Automatically save before commands like :next and :make
" set hidden             " Hide buffers when they are abandoned
" set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

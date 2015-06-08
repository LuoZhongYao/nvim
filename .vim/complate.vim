"cscope 程序路径
set nocsverb
if filereadable("/usr/local/bin/gtags-cscope")
    set csprg=/usr/local/bin/gtags-cscope
    cs add GTAGS
    nmap \mt :!gtags<cr>:cs add GTAGS<cr>
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
nmap \t :cs find s <C-R>=expand("<cword>")<CR><CR>         " """"""""""""""""""""""""""""""""""""""
nmap \d :cs find g <C-R>=expand("<cword>")<CR><CR>         " cscope 命令
nmap \l :cs find d <C-R>=expand("<cword>")<CR><CR>         " 
nmap \c :cs find c <C-R>=expand("<cword>")<CR><CR>         " :cs find {querytype} {name} 
nmap \s :cs find t <C-R>=expand("<cword>")<CR><CR>          " see :help cs
nmap \f :cs find f <C-R>=expand("<cfile>")<CR><CR>          " {querytype} :
nmap \i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>        " 0 / s : 查找本C符号
" =模式分栏                                                 " 1 / g : 查找定义
nmap \-t :scs find s <C-R>=expand("<cword>")<CR><CR>       " 2 / d : 查找调用
nmap \-d :scs find g <C-R>=expand("<cword>")<CR><CR>       " 3 / c : 查找被调用
nmap \-l :scs find d <C-R>=expand("<cword>")<CR><CR>       " 4 / t : 查找字符串
nmap \-c :scs find c <C-R>=expand("<cword>")<CR><CR>       " 6 / e : egrep                          
nmap \-s :scs find t <C-R>=expand("<cword>")<CR><CR>        " 7 / f : 查找文件
nmap \-f :scs find f <C-R>=expand("<cfile>")<CR><CR>        " 8 / i : 查找包含本文件的文件 
nmap \-i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>      " """"""""""""""""""""""""""""""""""""""
" || 模式分栏
nmap \|t :vert scs find s <C-R>=expand("<cword>")<CR><CR>
nmap \|d  :vert scs find g <C-R>=expand("<cword>")<CR><CR>
nmap \|l :vert scs find d <C-R>=expand("<cword>")<CR><CR>
nmap \|c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
nmap \|s :vert scs find t <C-R>=expand("<cword>")<CR><CR>
nmap \|f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
nmap \|i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>

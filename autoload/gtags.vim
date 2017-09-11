set cscopequickfix=s-,c-,d-,i-,t-,e-,g-
"优先搜索cscope库
set csto=0
"CTRL_] 使用 :cstag而不是tag
set cst
set csverb

" gtags
nmap <Leader>s :cs find s <C-R>=expand("<cword>")<CR><CR>     
nmap <Leader>g :cs find g <C-R>=expand("<cword>")<CR><CR>     
nmap <Leader>d :cs find d <C-R>=expand("<cword>")<CR><CR>     
nmap <Leader>c :cs find c <C-R>=expand("<cword>")<CR><CR>     
nmap <Leader>t :cs find t <C-R>=expand("<cword>")<CR><CR>     
nmap <Leader>f :cs find f <C-R>=expand("<cfile>")<CR><CR>     
nmap <Leader>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>   
" =模式分栏                                                   
nmap <Leader>-s :scs find s <C-R>=expand("<cword>")<CR><CR>   
nmap <Leader>-g :scs find g <C-R>=expand("<cword>")<CR><CR>   
nmap <Leader>-d :scs find d <C-R>=expand("<cword>")<CR><CR>   
nmap <Leader>-c :scs find c <C-R>=expand("<cword>")<CR><CR>   
nmap <Leader>-t :scs find t <C-R>=expand("<cword>")<CR><CR>   
nmap <Leader>-f :scs find f <C-R>=expand("<cfile>")<CR><CR>   
nmap <Leader>-i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR> 
" || 模式分栏
nmap <Leader>\|s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>\|g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>\|d :vert scs find d <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>\|c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>\|t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>\|f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <Leader>\|i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>


function! gtags#load()
    set nocsverb
    set csprg=/usr/bin/gtags-cscope
    let i = 0
    let project_dir =  ""
    while i < 20
        let i += 1
        if filereadable(project_dir . "GTAGS")
            exec "cs add " project_dir . "GTAGS"
            let &path = &path . project_dir . "**"
            break
        endif
        let project_dir = "../" . project_dir
    endwhile
endfunction

function! AddTag(job_id, data, event) dict
    exec "cs add GTAGS"
    echo "done!"
endfunction

nmap <Leader>mt :call jobstart(['gtags'], {'on_exit': 'AddTag'})<cr>
nmap <Leader>mu :call jobstart(['global', '-u'], {'on_exit': 'AddTag'})<cr>


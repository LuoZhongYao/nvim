if exists("loaded_gtags")
    finish
endif

let s:global_command = $GTAGSGLOBAL
if s:global_command == ''
        let s:global_command = "global"
endif

function! s:gtags_root()
    let cmd = s:global_command . " -pq"
    let cmd_output = system(cmd)
    if v:shell_error != 0
        return ''
    endif
    return strpart(cmd_output, 0, strlen(cmd_output) - 1)
endfunction

function! s:gtags_add()
	let gtagsroot = s:gtags_root()
	if gtagsroot != ''
		let s:command = "cs add " . gtagsroot . "/GTAGS"
		set nocsverb
		exe s:command
		set csverb
	endif
endfunction

function! gtags#load()
    set csprg=gtags-cscope
    set cscopequickfix=s-,c-,d-,i-,t-,e-,g-
    "优先搜索cscope库
    set csto=0
    "CTRL_] 使用 :cstag而不是tag
    set cst
	call s:gtags_add()
endfunction

function! AddTag(job_id, data, event) dict
	call s:gtags_add()
    echo "done!"
endfunction

nmap <Leader>mt :call jobstart(['gtags'], {'on_exit': 'AddTag'})<cr>
nmap <Leader>mu :call jobstart(['global', '-u'], {'on_exit': 'AddTag'})<cr>

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

let loaded_gtags = 1

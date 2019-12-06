augroup templates
    au!
    " read  in template files
    " autocmd BufNewFile *.* silent! execute '0r $HOME/.vim/templates/skeleton.'. expand("<afile>:e")
    autocmd BufNewFile *.h  call s:cmodule("h.tmpl")
    autocmd BufNewFile *.c  call s:cmodule("c.tmpl")
    autocmd BufNewFile *.sh silent! execute '0r ' . stdpath('config') . '/templates/sh.tmpl'

    fun s:cmodule(template)
        silent! execute '0r ' stdpath('config') . '/templates/' . a:template
        if line("$") > 20
            let l = 20
        else
            let l = line("$")
        endif
        silent! execute '1,' . l . 's/\[:YEAR:\]/\=strftime("%Y")'
        silent! execute '1,' . l . 's/\[:BASE:\]_\[:EXPAND:\]/\=substitute(expand("%:t"),"\\(.*\\)\\.\\(.*\\)","\\U\\1_\\2","")'
    endfunc
augroup END

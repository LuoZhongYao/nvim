augroup templates
    au!
    " read  in template files
    " autocmd BufNewFile *.* silent! execute '0r $HOME/.vim/templates/skeleton.'. expand("<afile>:e")
    autocmd BufNewFile *.h  call s:cmodule()
    autocmd BufNewFile *.sh silent! execute '0r ' . stdpath('config') . '/templates/template.' . expand("<afile>:e")

    fun s:cmodule()
        silent! execute '0r ' stdpath('config') . '/templates/template.' . expand("<afile>:e")
        if line("$") > 20
            let l = 20
        else
            let l = line("$")
        endif
        silent! execute '1,' . l . 's/\[:BASE:\]_\[:EXPAND:\]/\=substitute(expand("%:t"),"\\(.*\\)\\.\\(.*\\)","\\U\\1_\\2","")'
        silent! execute '1,' . l . 'g/Modified: /s/\(Modified: \).*/\1' . strftime('%Y\/%m\/%d')
    endfunc
augroup END

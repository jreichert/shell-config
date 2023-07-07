augroup ResolveConflicts
    " There must be a better way to do this
    autocmd BufEnter <buffer> {
        setlocal cocu=cn
        if exists('g:indentLine_setConceal')
            g:indentLine_setConcealOldValue = g:indentLine_setConceal
            g:indentLine_setConceal = 0
        endif
    }
    autocmd BufLeave <buffer> {
        if exists('g:indentLine_setConcealOldValue')
            g:indentLine_setConceal = g:indentLine_setConcealOldValue
        endif
    }
augroup END

augroup FoldingResolveConflicts
    " There must be a better way to do this
    autocmd BufEnter <buffer> {
        if exists('g:vim_markdown_folding_disabled')
            g:vim_markdown_folding_disabled_old_value = g:vim_markdown_folding_disabled
        else
            g:vim_markdown_folding_disabled_old_value = 0
        endif
        g:vim_markdown_folding_disabled = 1
    }
    autocmd BufLeave <buffer> {
        g:vim_markdown_folding_disabled = g:vim_markdown_folding_disabled_old_value
    }
augroup END

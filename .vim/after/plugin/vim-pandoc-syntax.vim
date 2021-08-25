" Markdown is now pandoc dialect
augroup pandoc_syntax
    autocmd!
    autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END

" conceal the URLs
let g:pandoc#syntax#conceal#urls=1

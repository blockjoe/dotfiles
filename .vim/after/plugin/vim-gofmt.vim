augroup GoFormatter
  autocmd!
  autocmd Filetype go nnoremap <F8> :GoFmt<CR>:GoImports<CR>
  autocmd BufWritePre *.go execute ':GoFmt'
  autocmd BufWritePre *.go execute ':GoImports'
augroup END

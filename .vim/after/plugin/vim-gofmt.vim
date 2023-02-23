augroup GoFormatter
  autocmd!
  autocmd Filetype go nnoremap <F8> :GoFmt<CR>:GoImports<CR>
  autocmd BufWritePre *.go execute ':GoFmt'
augroup END

augroup PythonBlack
  autocmd!
  autocmd Filetype python nnoremap <F8> :Black<CR>
  autocmd BufWritePre *.py execute ':Black'
augroup END

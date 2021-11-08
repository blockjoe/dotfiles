xmap <leader>a <Plug>(EasyAlign)
nmap <leader>a <Plug>(EasyAlign)

augroup AlignFileSpecific
  autocmd!
  autocmd FileType markdown nmap <silent> <leader><Bslash> vip:EasyAlign*<Bar><CR><ESC>
  autocmd FileType markdown xmap <silent> <leader><Bslash> :EasyAlign*<Bar><CR>
augroup END

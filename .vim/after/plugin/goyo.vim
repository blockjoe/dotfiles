nnoremap <leader>q :Goyo<CR>

augroup GoyoLimelight
  autocmd!
  autocmd User GoyoEnter Limelight
  autocmd User GoyoLeave Limelight!
augroup END

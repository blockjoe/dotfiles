" A function to go to a specific window and maximize it
function! GoToWindow(id)
  call win_gotoid(a:id)
  MaximizerToggle
endfunction

nnoremap <silent><leader>m :MaximizerToggle<CR>
vnoremap <silent><leader>m :MaximizerToggle<CR>gv

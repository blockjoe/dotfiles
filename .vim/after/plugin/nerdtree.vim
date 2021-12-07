nnoremap <leader>t :NERDTreeFocus<CR>
nnoremap <silent> <C-T> :NERDTreeToggle<CR> :call lightline#update()<CR>
nnoremap <leader>ft :NERDTreeFind<CR>

augroup NTree
  autocmd!
  autocmd StdinReadPre * let s:std_in=1 "Set on launch flag
  "Launch nerdtree if no file args are given to vim.
  autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | call lightline#update() | endif
  "Launch nerdtree if a directory is given as arg to vim
  autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | call lightline#update() | wincmd p | enew | execute 'cd '.argv()[0] | endif
  "Exit vim if only NerdTree is open
  autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
  "Close the tab if only NerdTree is open
  autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
augroup END

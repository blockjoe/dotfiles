" # Basic Config #
colorscheme one
" ## UTF-8 ##
set encoding=UTF-8
" ## vim not vi ##
set nocompatible
" ## Space as leader ##
let mapleader=' '
" ## See leader command ##
set showcmd
" ## Hybrid line numbers ##
set number relativenumber
" ## Backspace ##
set backspace=start,eol,indent
" ## Last status ##
set laststatus=2
" ## Persistant Undo ##
set undodir=~/.vim/undodir
set undofile
" ## Delete comment character on joining commented lines ##
set formatoptions+=j
" ## Colors ##
set term=xterm-256color
set termguicolors
" ## margin lines ##
set scrolloff=4
" ## incremental search ##
set incsearch
" ## Split below and to the right ##
set splitright splitbelow

" # Autocmds #
" Track last tab in variable
let g:lasttab=1
augroup TabLast
  autocmd!
  autocmd TabLeave * let g:lasttab = tabpagenr()
augroup END

" # Close vim if Quickfix is the last window/tab #
augroup CloseQF
  autocmd!
  autocmd WinEnter * if winnr('$') == 1 && &buftype == "quickfix"|q|endif
augroup END

" # Normal Mode Mappings #
" ## Change Ex mode to last macro ##
nnoremap Q @@
" ## <C-hjkl> for split navigation ##
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" ## Split Resizing ##
nnoremap <silent> <leader>= :exe "resize " . (winheight(0) * 5/4)<CR>
nnoremap <silent> <leader>- :exe "resize " . (winheight(0) * 4/5)<CR>
" ## <Alt-h/l> => prev tab/next tab by index ##
nnoremap <leader>H gT " <a-h>
nnoremap <leader>L gt " <a-l>
" ## <Alt-j/k> toggles between previous and last opened tab ##
nnoremap <silent> <leader>J :exe "tabn ".g:lasttab<CR>
nnoremap <silent> <leader>K :exe "tabn ".g:lasttab<CR>
" ## Easier delete to null register ##
nnoremap <leader>d "_d
" ## cd to file directory ##
nnoremap <leader>cd :lcd %:h<CR>
" ## open ~/.vimrc in new tab ##
nnoremap <leader>vimrc :tabedit $MYVIMRC<CR>
" ## toggle conceal between 0 and 2 ##
nnoremap <leader>rd :setlocal conceallevel=<c-r>=&conceallevel == 0 ? '2' : '0'<cr><cr>
" ## make Y yank to end of line instead of yy ##
nnoremap Y y$"
" ## map yank to clipboard ##
nnoremap <leader>y "+y
nnoremap <leader>Y "+y$
" ## map put from clipboard ##
nnoremap <leader>p "+p
nnoremap <leader>P "+P
" ## map from select (three finger/middle click) ##
nnoremap <leader>o "*p
nnoremap <leader>O "*P


" # Insert Mode Mappings #
" ## Quick Spellcheck fix ##
imap <C-Q> <Esc>[s1z=`]a
" ## –  with control on dash ##
imap <C-_> <C-k>-N

" # Internal Plugins #
" ## Syntax highlighting from ~/.vim/syntax ##
syntax enable
" ## Filtetype specific plugins from ~/.vim/ftplugin ##
filetype plugin on
" ## Filtetype based indenting from ~/.vim/indent ##
filetype indent on


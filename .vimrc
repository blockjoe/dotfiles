" vim not vi
set nocompatible

" Hybrid line numbers
set number relativenumber

" Backspace
set backspace=start,eol,indent

" Better split behavior
set splitright splitbelow
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Two semicolons for Escape
imap ;; <Esc>

" Enable builtin syntax highlighting .vim/syntax
syntax enable

" Enable filtetype plugins .vim/ftplugin
filetype plugin on

" Enable filtetype based indenting .vim/indent
filetype indent on

" External Plugins
" init
call plug#begin("~/.vim/plugged")

" Quote, (), and [] manipulations
Plug 'tpope/vim-surround'

" Highlight and fix trailing whitespace
Plug 'bronson/vim-trailing-whitespace'

" Project Tree view
Plug 'scrooloose/nerdtree'

" Comment manipulations
Plug 'scrooloose/nerdcommenter'

" Added language support
Plug 'sheerun/vim-polyglot'

" Autocomplete
Plug 'ackyshake/VimCompletesMe'

" Centered view; good for reading prose
Plug 'junegunn/goyo.vim'

" Solidity syntax highlighting
Plug 'tomlion/vim-solidity'

call plug#end()

" Global mappings

nnoremap <C-S> :NERDTreeToggle<CR>

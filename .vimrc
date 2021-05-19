" vim not vi
set nocompatible

" Hybrid line numbers
set number relativenumber

" Clipboard
set clipboard=unamedplus

" Backspace
set backspace=start,eol,indent

" Split right and below
set splitright splitbelow

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

call plug#end()

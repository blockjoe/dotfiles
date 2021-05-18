" vim not vi
set nocompatible

" Hybrid line numbers
set number relativenumber

" Clipboard
set clipboard=unamedplus

" Backspace
set backspace=start,eol,indent

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

Plug 'tpope/vim-surround'

Plug 'bronson/vim-trailing-whitespace'

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'

Plug 'sheerun/vim-polyglot'

Plug 'ackyshake/VimCompletesMe'

Plug 'junegunn/goyo.vim'

call plug#end()

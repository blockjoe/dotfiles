set nocompatible

" Clipboard
set clipboard=unamedplus

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

call plug#end()

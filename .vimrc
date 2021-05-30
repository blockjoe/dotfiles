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

" Custom text objects
Plug 'kana/vim-textobj-user'

Plug 'fvictorio/vim-textobj-backticks'
Plug 'kana/vim-textobj-diff'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'lucapette/vim-textobj-underscore'
Plug 'mattn/vim-textobj-url'
Plug 'rbonvall/vim-textobj-latex'
Plug 'coachshea/vim-textobj-markdown'
Plug 'bps/vim-textobj-python'

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

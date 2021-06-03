set encoding=UTF-8
" vim not vi
set nocompatible

" leader
let mapleader=' '

" Hybrid line numbers
set number relativenumber

nnoremap <leader>ss :set hlsearch!<CR>

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

" Last status
set laststatus=2

" External Plugins
" init
call plug#begin("~/.vim/plugged")

" Custom text object library

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

" Comment manipulations
Plug 'scrooloose/nerdcommenter'

" Quote, (), and [] manipulations
Plug 'tpope/vim-surround'

" Highlight and fix trailing whitespace
Plug 'bronson/vim-trailing-whitespace'

" Project Tree view
Plug 'scrooloose/nerdtree'

" fzf integration
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" Language Specifics

" Added language support
Plug 'sheerun/vim-polyglot'
" Solidity syntax highlighting
Plug 'tomlion/vim-solidity'
"HTML/JS/CSS
Plug 'mattn/emmet-vim'

" Autocomplete
Plug 'ackyshake/VimCompletesMe'

" Rendering Type Stuff

" Centered view; good for reading prose
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
" Status Line
Plug 'itchyny/lightline.vim'
" Hex colors
Plug 'ap/vim-css-color'
" Sublime Cursors
Plug 'terryma/vim-multiple-cursors'
" devicons
Plug 'ryanoasis/vim-devicons'
" Brackets
Plug 'frazrepo/vim-rainbow'
" Highlight yank
Plug 'machakann/vim-highlightedyank'

call plug#end()

" Lightline
set background=dark
let g:lightline = {
      \ 'background' : 'dark',
      \ 'colorscheme': 'one',
      \ 'active': {
  \         'left': [['mode', 'paste' ], ['readonly', 'filename', 'modified']],
  \         'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
  \     }
\ }

" File explorer
nnoremap <leader>tt :NERDTreeToggle<CR>

" FZF
nnoremap <leader>ff :Files<CR>
nnoremap <leader>? :Maps<CR>

let g:fzf_action = {
            \ 'ctrl-t': 'tab split',
            \ 'alt-]': 'split',
            \ 'ctrl-]': 'vsplit',
            \ 'ctrl-o': '!open' }

" Goyo and Limelight
nnoremap <leader>q :Goyo<CR>
nnoremap <leader>ll :Limelight!!<CR>

let g:limelight_conceal_ctermfg = 240

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

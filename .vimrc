" # Basic Config #

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
nnoremap h gT " <a-h>
nnoremap l gt " <a-l>
" ## <Alt-j/k> toggles between previous and last opened tab ##
nnoremap <silent> j :exe "tabn ".g:lasttab<CR>
nnoremap <silent> k :exe "tabn ".g:lasttab<CR>
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

" # External Plugins #
" ## Variable Init ##
let g:coc_node_path = '/usr/bin/node'
let $FZF_DEFAULT_COMMAND.=' --hidden'
let $PYTHONUNBUFFERED=1
let g:maximizer_set_default_mapping = 0
let g:goyo_width = 81

" ## Loading the Plugins ##
call plug#begin("~/.vim/plugged")

" ## Custom text objects ##
" ### Base ###
Plug 'kana/vim-textobj-user'
" ### Community defined ###
Plug 'fvictorio/vim-textobj-backticks'
Plug 'kana/vim-textobj-diff'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'lucapette/vim-textobj-underscore'
Plug 'mattn/vim-textobj-url'
Plug 'adolenc/vim-textobj-toplevel'
Plug 'jasonlong/vim-textobj-css'
Plug 'rbonvall/vim-textobj-latex'
Plug 'coachshea/vim-textobj-markdown'

" ## Comment manipulations ##
Plug 'scrooloose/nerdcommenter'
" ## File explorer ##
Plug 'preservim/nerdtree'
" ## Date Incrementing ##
Plug 'tpope/vim-speeddating'
" ## Quote, (), and [] manipulations ##
Plug 'tpope/vim-surround'
" ## '.' support for plugins ##
Plug 'tpope/vim-repeat'
" ## Weird mix of case combination handling ##
Plug 'tpope/vim-abolish'
" ## Unimpaired ##
Plug 'tpope/vim-unimpaired'
" ## FftT across lines ##
Plug 'dahu/vim-fanfingtastic'
" ## Align GH markdown charts ##
Plug 'junegunn/vim-easy-align'

" ## Async Stuff ##

" ### Async Make Dispatch (vimspector) ###
Plug 'tpope/vim-dispatch'
" ### Async Make (vim-test) ###
Plug 'neomake/neomake'
" ### Async Runner (my runners) ###
Plug 'skywind3000/asyncrun.vim'

"## Language specific plugins ##
" ### Pandoc markdown formatting and conceal ###
Plug 'vim-pandoc/vim-pandoc-syntax'
" ### A solid catchall language pack ###
Plug 'sheerun/vim-polyglot'
" ### Python autoformatter ###
Plug 'psf/black', { 'branch': 'stable' }


" ## fzf ##
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" ## COC (VSCode extensions) ##
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': { -> coc#util#install()}}
" ## Interactive Testing ##
Plug 'vim-test/vim-test'
" ## Interactive Debugging ##
Plug 'puremourning/vimspector'

" ## Highlight and fix trailing whitespace ##
Plug 'ntpeters/vim-better-whitespace'
" ## Highlight what was yanked. ##
Plug 'machakann/vim-highlightedyank'
" ## Snippets ##
Plug 'honza/vim-snippets'

" ## Onedark Colorscheme ##
Plug 'joshdick/onedark.vim'
" ## Paper Colorscheme ##
Plug 'NLKNguyen/papercolor-theme'
" ## Split 'Zoom' Behavior ##
Plug 'szw/vim-maximizer'
" ## Centered View, 'focus-mode' ##
Plug 'junegunn/goyo.vim'
" ## Dim all text not in current paragraph ##
Plug 'junegunn/limelight.vim'
" ## Status Line ##
Plug 'itchyny/lightline.vim'
" ## COC Functions for Status Line ##
Plug 'josa42/vim-lightline-coc'
" ## Hightlighting of hex color codes in that color ##
Plug 'ap/vim-css-color'

" !!! MUST BE FINAL IMPORT !!!
" ## UTF-8 font icons ##
Plug 'ryanoasis/vim-devicons'

call plug#end()


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
set termguicolors

" # Mappings #

" ## Spell Check ##
nnoremap <leader>sc :setlocal spell!<CR>

" ## Highlight search matches ##
nnoremap <leader>ss :set hlsearch!<CR>

" ## Better split navigation ##
set splitright splitbelow
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" ## Two semicolons for Escape ##
imap ;; <Esc>

" # Internal Plugins #

" ## Syntax highlighting from ~/.vim/syntax ##
syntax enable

" ## Filtetype specific plugins from ~/.vim/ftplugin ##
filetype plugin on

" ## Filtetype based indenting from ~/.vim/indent ##
filetype indent on

" # Autocmds #

" ## Spellcheck on ##
autocmd FileType markdown setlocal spell

" # Loading External Plugins #

call plug#begin("~/.vim/plugged")

" ## Vim specific ##
" ### Custom text objects ###

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

" ### Comment manipulations ###
Plug 'scrooloose/nerdcommenter'
" ### Date Incrementing ###
Plug 'tpope/vim-speeddating'
" ### Quote, (), and [] manipulations ###
Plug 'tpope/vim-surround'
" ### . support for plugins ###
Plug 'tpope/vim-repeat'


" ## Plugins with additional windows ##

" ### Project Tree view ###
Plug 'scrooloose/nerdtree'

" ### fzf ###
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" ## Language Syntax/Compilers ##

" ### A solid catchall ###
Plug 'sheerun/vim-polyglot'
" ### Solidity syntax ###
Plug 'tomlion/vim-solidity'
" ### HTML/JS/CSS ###
Plug 'mattn/emmet-vim'

" ## IDE-Like 'Behavior' Plugins  ##

" ### Highlike and fix trailing whitespace ###
Plug 'ntpeters/vim-better-whitespace'
" ### Highlight what was yanked. ###
Plug 'machakann/vim-highlightedyank'
" ### Autocomplete ###
Plug 'ackyshake/VimCompletesMe'
" ### Sublime-style multiple cursors ###
Plug 'mg979/vim-visual-multi', {'branch' : 'master'}
" ### ctags ###
Plug 'ludovicchabant/vim-gutentags'

" ## IDE-Like 'Rendering/Visual' Plugins ##

" ### Onedark Colorscheme ###
Plug 'joshdick/onedark.vim'
" ### Colored bracket matching ###
Plug 'frazrepo/vim-rainbow'
" ### Centered View, 'focus-mode' ###
Plug 'junegunn/goyo.vim'
" ### Dim all text not in current paragraph ###
Plug 'junegunn/limelight.vim'
" ### Status Line ###
Plug 'itchyny/lightline.vim'
" ### Hightlighting of hex color codes in that color ###
Plug 'ap/vim-css-color'
" ### UTF-8 font icons ###
Plug 'ryanoasis/vim-devicons'

call plug#end()

" # External Plugin Config #

" ## onedark colorscheme ##
" Don't set a background color when running in a terminal;
" just use the terminal's background color
" `gui` is the hex color code used in GUI mode/nvim true-color mode
" `cterm` is the color code used in 256-color mode
" `cterm16` is the color code used in 16-color mode
if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
    let s:comment = { "gui" : "#737C8C", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Comment", { "fg": s:comment })
  augroup END
endif
colorscheme onedark

" ## Better Whitespace ##
nnoremap <C-f> :StripWhitespace<CR>

" ## Rainbow bracket matching ##
nnoremap <leader>bb :RainbowToggle<CR>

" ## Lightline ##
set background=dark
let g:lightline = {
      \ 'background' : 'dark',
      \ 'colorscheme': 'one',
      \ 'active': {
  \         'left': [['mode', 'paste' ], ['readonly', 'filename', 'modified']],
  \         'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
  \     }
\ }

" ## NERDTree ##
nnoremap <leader>tt :NERDTreeToggle<CR>

" ## FZF ##
nnoremap <leader>ff :Files<CR>
nnoremap <leader>? :Maps<CR>

let g:fzf_action = {
            \ 'ctrl-t': 'tab split',
            \ 'alt-]': 'split',
            \ 'ctrl-]': 'vsplit',
            \ 'ctrl-o': '!open' }

" ## Goyo ##
nnoremap <leader>q :Goyo<CR>

" ## Limelight ##
nnoremap <leader>ll :Limelight!!<CR>
" Manually specify concel color because no bg set.
let g:limelight_conceal_ctermfg = 240
let g:limelight_conceal_guifg = '#393e46'

" Keep the hlsearch highlight
let g:limelight_priority=-1

" ## Toggle Limelight when entering/leaving Goyo ##
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

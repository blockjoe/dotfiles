" # Basic Config #

" ## UTF-8 ##
set encoding=UTF-8
" ## vim not vi ##
set nocompatible

" ## Space as leader ##
let mapleader=' '

" ## No mode status since we have lightline ##
set noshowmode

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

" ## margin lines "
set scrolloff=4

" ## COC Config ##
" https://github.com/neoclide/coc.nvim#example-vim-configuration

" TextEdit might fail
set hidden
" Some LSPs break on backups
set nobackup
set nowritebackup
" Less delays
set updatetime=300
" Don't pass messages to |ins-completion-menu|
set shortmess+=c

" Always show signcolumn
set signcolumn=yes

" # Normal Mode Mappings #

" ## Change Ex mode to last macro ##
nnoremap Q @@

" ## Better split navigation ##
set splitright splitbelow
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" ### Better tab navigation ###
au TabLeave * let g:lasttab = tabpagenr()
" <Alt-h/l> => prev/next
nnoremap h gT " <a-h>
nnoremap l gt " <a-l>
" <Alt-j/k> toggles between previous and last
nnoremap <silent> j :exe "tabn ".g:lasttab<CR>
nnoremap <silent> k :exe "tabn ".g:lasttab<CR>

" ## Easier delete to null register ##
nnoremap <leader>d "_d

" cd to file directory
nnoremap <leader>cd :lcd %:h<CR>

" open ~/.vimrc
nnoremap <leader>vimrc :tabedit $MYVIMRC<CR>

" # Insert Mode Mappings #
" ## Quick Spellcheck fix ##
imap <C-Q> <Esc>[s1z=`]a

" # Close if Quickfix is the last window/tab #
augroup CloseQF
  autocmd!
  autocmd WinEnter * if winnr('$') == 1 && &buftype == "quickfix"|q|endif
augroup END

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

" ## Variable Init ##
let g:coc_node_path = '/usr/bin/node'

let $FZF_DEFAULT_COMMAND.=' --hidden'

let $PYTHONUNBUFFERED=1

let g:maximizer_set_default_mapping = 0

" ## Vim specific ##
" ### Custom text objects ###
" #### Base ####
Plug 'kana/vim-textobj-user'
" #### Community defined ####
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

" ### Comment manipulations ###
Plug 'scrooloose/nerdcommenter'
" ### Date Incrementing ###
Plug 'tpope/vim-speeddating'
" ### Quote, (), and [] manipulations ###
Plug 'tpope/vim-surround'
" ### . support for plugins ###
Plug 'tpope/vim-repeat'
" ### Weird mix of case combination handling ###
Plug 'tpope/vim-abolish'
" ### Async Make Dispatch ###
Plug 'tpope/vim-dispatch'
" ### Unimpaired ###
Plug 'tpope/vim-unimpaired'

" ### Async Make ###
Plug 'neomake/neomake'

" ### Async Runner ###
Plug 'skywind3000/asyncrun.vim'

" ## Plugins with additional windows ##

" ### Project Tree view ###
Plug 'scrooloose/nerdtree'

" ### fzf ###
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" ## Language Syntax/Compilers ##

" ### A solid catchall ###
Plug 'sheerun/vim-polyglot'
" ### Solidity compiler ###
Plug 'dmdque/solidity.vim'
" ### JSON with Comments ###
Plug 'kevinoid/vim-jsonc'

" ## IDE-Like 'Behavior' Plugins  ##

" ### Highlighting of motion searches ###
Plug 'easymotion/vim-easymotion'
" ### COC ###
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': { -> coc#util#install()}}
" ### Interactive Testing ###
Plug 'vim-test/vim-test'
" ### Interactive Debugging ###
Plug 'puremourning/vimspector'

" ### Highlight and fix trailing whitespace ###
Plug 'ntpeters/vim-better-whitespace'
" ### Highlight what was yanked. ###
Plug 'machakann/vim-highlightedyank'
" ### Sublime-style multiple cursors ###
Plug 'mg979/vim-visual-multi', {'branch' : 'master'}
" ### Snippets ###
Plug 'honza/vim-snippets'

" ## IDE-Like 'Rendering/Visual' Plugins ##

" ### Onedark Colorscheme ###
Plug 'joshdick/onedark.vim'
" ### Colored bracket matching ###
Plug 'frazrepo/vim-rainbow'
" ### Split 'Zoom' Behavior ###
Plug 'szw/vim-maximizer'
" ### Centered View, 'focus-mode' ###
Plug 'junegunn/goyo.vim'
" ### Dim all text not in current paragraph ###
Plug 'junegunn/limelight.vim'
" ### Status Line ###
Plug 'itchyny/lightline.vim'
" ### COC Functions for Status Line ###
Plug 'josa42/vim-lightline-coc'
" ### Hightlighting of hex color codes in that color ###
Plug 'ap/vim-css-color'

" !!! MUST BE FINAL IMPORT !!!
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
    let s:gutter = { "gui" : "#768098", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("LineNr", {"fg": s:gutter})
    let s:vert = { "gui" : "#70777e", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("VertSplit", {"fg": s:vert})
  augroup END
endif
colorscheme onedark

" ## COC ##
" extensions
let g:coc_global_extensions = [
  \ "coc-css",
  \ "coc-json",
  \ "coc-docker",
  \ "coc-docthis",
  \ "coc-markdownlint",
  \ "coc-markmap",
  \ "coc-reveal",
  \ "coc-pyright",
  \ "coc-react-refactor",
  \ "coc-sh",
  \ "coc-emmet",
  \ "coc-tsserver",
  \ "coc-eslint",
  \ "coc-prettier",
  \ "coc-yaml",
  \ "coc-yank",
  \ "coc-snippets",
  \ "coc-html-css-support",
  \ "coc-marketplace" ]

" :Prettier will format the current buffer
command -nargs=0 Prettier :CocCommand prettier.formatFile
" marketplace available through :CocMP
command -nargs=0 CocMP :CocList marketplace

" TAB for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" ctrl + @  to trigger completion
inoremap <silent><expr> <c-@> coc#refresh()

" Enter to confirm completetion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" Use K to either doHover or show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
" Rename current word
nmap <leader>rn <Plug>(coc-rename)

" COC Language Specific Function and Class Text Objects
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" JSDoc
autocmd FileType javascript nnoremap <silent> <leader>md :CocCommand docthis.documentThis<CR>

" ### Async Run ###

let g:job_killed = 0
let g:job_presenting = 0

function! InitAsyncBufferStatus()
  if !exists('b:ar_status')
    let b:ar_status = ''
    let b:ar_spawned = 0
  else
    if b:ar_spawned == 1
      let b:ar_status = g:asyncrun_status
      if g:job_killed == 1
        let b:ar_status = 'killed'
        let g:job_presenting = 0
      endif
      if g:job_presenting == 1
        let b:ar_status = 'presenting'
      endif
      if b:ar_status != 'running' || b:ar_status != 'presenting'
        let b:ar_spawned = 0
      endif
    endif
  endif
endfunction

function! AsyncStarted()
  let b:ar_spawned = 1
  let g:job_killed = 0
  if g:job_presenting == 0
    let b:ar_status = g:asyncrun_status
  else
    let b:ar_status = 'presenting'
  endif
  call asyncrun#quickfix_toggle(8, 1)
endfunction

function! AsyncDone()
  if b:ar_spawned == 1
    if g:job_killed == 0
      let b:ar_status = g:asyncrun_status
    else
      let b:ar_status = 'killed'
    endif
    let b:ar_spawned = 0
  endif
  let g:job_presenting = 0
  echo "AsyncDone"
endfunction

function! AsyncKill() abort
  :call asyncrun#quickfix_toggle(8, 0)
  if g:asyncrun_status == 'running'
    let g:job_killed = 1
    let g:job_presenting = 0
    :AsyncStop!
    echo "Killed running async process."
  else
    echo "No async process to kill."
  endif
endfunction

augroup asrun
  autocmd!
  autocmd BufEnter * call InitAsyncBufferStatus()
  autocmd User AsyncRunStart call AsyncStarted()
  autocmd User AsyncRunStop call AsyncDone()
augroup asrun

function! AsyncStatus() abort
  let l:status = ''
  if b:ar_status == 'running'
    let l:status = "\uF252"
  elseif b:ar_status == 'success'
    let l:status =  "\uF164"
  elseif b:ar_status == 'failure'
    let l:status =  "\uF165"
  elseif b:ar_status == 'killed'
    let l:status = "\uF0C8"
  elseif b:ar_status == 'presenting'
    let l:status = "\uF927"
  endif
  return l:status
endfunction


" Kill running async job with F4
noremap <F4> :call AsyncKill()<CR>

" Toggle quickfix for asyncrun with F6
noremap <silent> <F6> :call asyncrun#quickfix_toggle(8)<CR>

" ### vimspector ###
let g:vimpsector_enable_mappings = 'HUMAN'
let g:vimpsector_base_dir=expand('$HOME/.config/vimspector')
let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-bash-debug', 'debugger-for-chrome', 'vscode-node-debug2' ]

function! GoToWindow(id)
  call win_gotoid(a:id)
  MaximizerToggle
endfunction

" Mappings

" Start/Stop
nnoremap <leader>il :call vimspector#Launch()<CR>
nnoremap <leader>ie :call vimspector#Reset()<CR>

" Zoom to the Window
nnoremap <leader>zc :call GoToWindow(g:vimspector_session_windows.code)<CR>
nnoremap <leader>zv :call GoToWindow(g:vimspector_session_windows.variables)<CR>
nnoremap <leader>zt :call GoToWindow(g:vimspector_session_windows.tagpage)<CR>
nnoremap <leader>zw :call GoToWindow(g:vimspector_session_windows.watches)<CR>
nnoremap <leader>zo :call GoToWindow(g:vimspector_session_windows.output)<CR>
nnoremap <leader>zst :call GoToWindow(g:vimspector_session_windows.stack_trace)<CR>

" Stepping
nmap <leader>isi <Plug>VimspectorStepInto
nmap <leader>iss <Plug>VimspectorStepOver
nmap <leader>iso <Plug>VimspectorStepOut
nnoremap <leader>ic :call vimspector#Continue()<CR>
nmap <leader>ir <Plug>VimspectorRestart

" Breakpoints
nmap <leader>bp <Plug>VimspectorToggleBreakpoint
nmap <leader>cbp <Plug>VimspectorToggleConditionalBreakpoint
nmap <leader>rth <Plug>VimspectorRunToCursor
nnoremap <leader>rbp :call vimspector#ClearBreakpoints()<CR>

" Popup of value of variable under cursor.
nmap <leader>ia <Plug>VimspectorBalloonEval

" Up and down the stack
nmap [s <Plug>VimspectorUpFrame
nmap ]s <Plug>VimspectorDownFrame


" ### vim-test ###

" Custom Strats
function! JestDebugStrategy(cmd)
  let testName = matchlist(a:cmd, '\v -t ''(.*)''')[1]
  call vimspector#LaunchWithSettings( #{ configuration: 'jest', TestName: testName } )
endfunction

let g:test#custom_strategies = {'jest': function('JestDebugStrategy')}

" executables
let g:test#javascript#runner = 'jest'

" use jest-vim-reporter for nicer jest output
let g:test#javascript#jest#options = '--reporters jest-vim-reporter'
" use neomake for running strategy
let test#strategy = "neomake"
" don't open the run results
let g:neomake_open_list = 0

" Mappings
nnoremap <leader>tn :TestNearest<CR>
nnoremap <leader>tf :TestFile<CR>
nnoremap <leader>ts :TestSuite<CR>
nnoremap <leader>tl :TestLast<CR>
" Latest run test file from anywhere.
nnoremap <leader>tv :TestVisit<CR>
" Run the nearest test verbose
nnoremap <leader>tm :exec RunTestVerbose()<CR>
nnoremap <leader>td :exec RunJestDebug()<CR>

" Run Debug
function! RunJestDebug()
  let g:test#javascript#jest#options=''
  :TestNearest -strategy=jest
  let g:test#javascript#jest#options = '--reporters jest-vim-reporter'
endfunction

" Verbose output
function! RunTestVerbose()
  let g:test#javascript#jest#options=''
  :TestNearest -strategy="vimterminal"
  let g:test#javascript#jest#options = '--reporters jest-vim-reporter'
endfunction

" Status hooks
augroup neomake_hook
  au!
  autocmd User NeomakeJobFinished call TestFinished()
  autocmd User NeomakeJobStarted call TestStarted()
augroup END

" Test Status Functions
let g:testing_status = ''
function! TestStarted() abort
  let g:testing_status = "\uF252 "
endfunction

function! TestFinished() abort
  let context = g:neomake_hook_context
  if context.jobinfo.exit_code == 0
    let g:testing_status = "\uF164 "
  endif
  if context.jobinfo.exit_code == 1
    let g:testing_status = "\uF165 "
  endif
endfunction

function! TestStatus() abort
  return g:testing_status
endfunction

" ### easymotion ###

" Settings
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0

" Match to colorscheme
hi link EasyMotionTarget search
hi link EasyMotionTarget2First Search
hi link EasyMotionTarget2Second Search
hi link EasyMotionShade Comment

map <Leader> <Plug>(easymotion-prefix)

map s <Plug>(easymotion-s)
map <Leader>s <Plug>(easymotion-s2)
map <Leader>w <Plug>(easymotion-bd-w)

map <Leader>t <Plug>(easymotion-bd-fl)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>kb <Plug>(easymotion-sol-k)
map <Leader>ke <Plug>(easymotion-eol-k)
map <Leader>k <Plug>(easymotion-k)
map <Leader>jb <Plug>(easymotion-sol-j)
map <Leader>je <Plug>(easymotion-eol-j)
map <Leader>j <Plug>(easymotion-j)
map <Leader>h <Plug>(easymotion-linebackward)

map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)


" ## Solidity Compiler ##
"augroup quickfix
"  autocmd!
"  autocmd QuickFixCmdPost make nested copen
"augroup END

" ## Better Whitespace ##
nnoremap <C-f> :StripWhitespace<CR>
inoremap <silent> <C-f> <ESC>mW:StripWhitespace<CR>`W:delmarks W<CR>i

" ## Rainbow bracket matching ##
nnoremap <leader>bb :RainbowToggle<CR>

" ## Lightline ##
set background=dark
let g:lightline = {
      \ 'background' : 'dark',
      \ 'colorscheme': 'one',
      \ 'active': {
  \         'left': [['mode'],
                    \['coc_info', 'coc_hints', 'coc_errors', 'coc_warnings', 'coc_ok'],
                    \['readonly', 'filename', 'teststatus', 'modified']],
  \         'right': [['lineinfo'], ['percent'], ['asyncstatus', 'filetype', 'fileformat', 'fileencoding']]
  \     },
    \ 'component_function': {
      \ 'teststatus': 'TestStatus',
      \ 'asyncstatus': 'AsyncStatus'
    \ }
\ }

let g:lightline#coc#indicator_warnings="\uF071 "
let g:lightline#coc#indicator_errors="\uF057 "
let g:lightline#coc#indicator_info="\uF05A "
let g:lightline#coc#indicator_hints="\uF7C6 "
call lightline#coc#register()

" ## NERDTree ##
nnoremap <leader>tt :NERDTreeToggle<CR>

" ## FZF ##
nnoremap <leader>ff :Files<CR>
nnoremap <leader>? :Maps<CR>
nnoremap <leader>sn :Snippets<CR>

let g:fzf_action = {
            \ 'ctrl-t': 'tab split',
            \ 'alt-]': 'split',
            \ 'ctrl-]': 'vsplit',
            \ 'ctrl-o': '!open' }

" ## Maximizer ##
nnoremap <silent><leader>m :MaximizerToggle<CR>
vnoremap <silent><leader>m :MaximizerToggle<CR>gv

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

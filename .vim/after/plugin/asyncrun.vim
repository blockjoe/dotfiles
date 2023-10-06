" Global status indicator values
let g:asrun_running_str = "\uF252"
let g:asrun_success_str = "\uF164"
let g:asrun_failure_str = "\uF165"
let g:asrun_killed_str = "\uF0C8"
let g:asrun_presenting_str = "\uF927"

let g:asyncrun_program = get(g:, 'asyncrun_program', {})

" Core Mappings
" Toggle quickfix for asyncrun with <F3>
noremap <silent> <F3> :call asyncrun#quickfix_toggle(8)<CR>
" Kill running async job with <F4>
noremap <F4> :call AsyncKill()<CR>

let g:last_cmd = ""
function! URun(...) abort
  let g:last_cmd = join(a:000, " ")
  let g:asyncrun_program.ucmd = { opts -> g:last_cmd }
  AsyncRun -raw -program=ucmd
endfunction

command! -nargs=+ Run call URun(<args>)

function! ReRun() abort
  if g:last_cmd == ""
    echo "No command last run. Use Run(cmd) function to set."
  else
    AsyncRun -raw -program=ucmd
  endif
endfunction
noremap <F9> <ESC>:w<CR>:call ReRun()<CR>


" Language specific

" Python
let g:last_py = ""
function! RunPythonFromCurrentFile() abort
  let g:last_py = expand('%:p')
  let g:asyncrun_program.repy = { opts -> opts.cmd . " " . g:last_py }
  AsyncRun -raw python "$(VIM_FILEPATH)"
endfunction

function! RerunLastPython() abort
  if g:last_py == ""
    echo "No Python file to rerun"
  else
        AsyncRun -raw -program=repy python
  endif
endfunction

augroup PythonRunners
  autocmd!
  autocmd Filetype python nmap <silent> <buffer> <F5> <ESC>:w<CR>:call RunPythonFromCurrentFile()<CR>
  autocmd Filetype python xnoremap <silent> <buffer> <F5> :'<,'>AsyncRun -raw python<CR>
  autocmd Filetype python nmap <silent> <buffer> <F6> <ESC>:w<CR>:call RerunLastPython()<CR>
augroup END

" Go
let g:last_go = ""
function! RunGoFromCurrentFile() abort
  let g:last_go = expand('%:p')
  let g:asyncrun_program.rego = { opts -> opts.cmd . " " . g:last_go }
  AsyncRun -raw go run "$(VIM_FILEPATH)"
endfunction

function! RerunLastGo() abort
  if g:last_go == ""
    echo "No Go file to rerun"
  else
        AsyncRun -raw -program=rego go run
  endif
endfunction

augroup GoRunners
  autocmd!
  autocmd Filetype go nmap <silent> <buffer> <F5> <ESC>:w<CR>:call RunGoFromCurrentFile()<CR>
  autocmd Filetype go nmap <silent> <buffer> <F6> <ESC>:w<CR>:call RerunLastGo()<CR>
augroup END

augroup VyperRunners
    autocmd!
    autocmd Filetype vyper map <silent> <buffer> <F5> <ESC>:w<CR>:AsyncRun -raw vyper "$(VIM_FILEPATH)"<CR>
    autocmd Filetype vyper map <silent> <buffer> <F6> <ESC>:w<CR>:AsyncRun -raw ape compile<CR>
    autocmd Filetype vyper map <silent> <buffer> <F7> <ESC>:w<CR>:AsyncRun -raw ape test<CR>
augroup END

" Javascript
augroup JavascriptRunners
  autocmd!
  autocmd Filetype javascript nmap <silent> <buffer> <F5> <ESC>:w<CR>:AsyncRun -raw node "$(VIM_FILEPATH)"<CR>
  autocmd Filetype javascript xnoremap <silent> <buffer> <F5> :'<,'>AsyncRun -raw node<CR>
augroup END

" Bash/sh
augroup ShellRunners
  autocmd!
  autocmd Filetype sh nmap <silent> <buffer> <F5> <ESC>:w<CR>:AsyncRun -raw bash "$(VIM_FILEPATH)"<CR>
  autocmd Filetype sh xnoremap <silent> <buffer> <F5> :'<,'>AsyncRun -raw bash<CR>
  autocmd Filetype sh nmap <silent> <buffer> <F6> <ESC>:w<CR>:AsyncRun -raw sh "$(VIM_FILEPATH)"<CR>
  autocmd Filetype sh xnoremap <silent> <buffer> <F6> :'<,'>AsyncRun -raw sh<CR>
augroup END

" Vimscript
augroup VimRunners
  autocmd!
  autocmd Filetype vim nmap <silent> <buffer> <F5> <ESC>:w<CR>:source %<CR>
augroup END

" Markdown
" Render markdown to Github HTML via grip
function! StartMarkdownHTMLPreview() abort
	let g:job_presenting = 1
	AsyncRun -raw grip -b "$(VIM_FILEPATH)"
endfunction

"Render markdown to PDF via pandoc
function! StartMarkdownPDFPreview() abort
	let g:job_presenting = 1
	AsyncRun -raw pandoc "$(VIM_FILEPATH)" --variable urlcolor=cyan -o %:p:r.pdf; open %:p:r.pdf; live-pandoc "$(VIM_FILEPATH)" --variable urlcolor=cyan -o %:p:r.pdf
endfunction

"Render markdown to revealjs slides via pandoc
function! StartMarkdownRevealPreview() abort
  let g:job_presenting = 1
  AsyncRun -raw pandoc "$(VIM_FILEPATH)" -s -t revealjs --slide-level 2 -o %:p:r.html; open %:p:r.html; live-pandoc "$(VIM_FILEPATH)" -s -t revealjs --slide-level 2 -o %:p:r.html
endfunction

augroup MarkdownRunners
  autocmd!
  autocmd Filetype markdown map <silent> <buffer> <F5> <ESC>:w<CR>:call StartMarkdownHTMLPreview()<CR>
  autocmd Filetype markdown map <silent> <buffer> <F6> <ESC>:w<CR>:call StartMarkdownPDFPreview()<CR>
  autocmd Filetype markdown map <silent> <buffer> <F7> <ESC>:w<CR>:call StartMarkdownRevealPreview()<CR>
augroup END

" All the functions for managing the AsyncStatus
let g:job_killed = 0
let g:job_presenting = 0

function! InitAsyncBufferStatus()
  let b:ar_status = get(b:, 'ar_status', '')
  let b:ar_spawned = get(b:, 'ar_spawned', 0)
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
endfunction

function! AsyncStarted()
  let b:ar_spawned = 1
  let g:job_killed = 0
  if g:job_presenting == 0
    let b:ar_status = g:asyncrun_status
  else
    let b:ar_status = 'presenting'
  endif
  call asyncrun#quickfix_toggle(10, 1)
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
  :call asyncrun#quickfix_toggle(10, 0)
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
  let b:ar_status = get(b:, 'ar_status', '')
  let b:ar_spawned = get(b:, 'ar_spawned', 0)
  let l:status = ''
  if b:ar_status == 'running'
    let l:status = g:asrun_running_str
  elseif b:ar_status == 'success'
    let l:status = g:asrun_success_str
  elseif b:ar_status == 'failure'
    let l:status =  g:asrun_failure_str
  elseif b:ar_status == 'killed'
    let l:status = g:asrun_killed_str
  elseif b:ar_status == 'presenting'
    let l:status = g:asrun_presenting_str
  endif
  return l:status
endfunction


" Global status indicator values
let g:asrun_running_str = "\uF252"
let g:asrun_success_str = "\uF164"
let g:asrun_failure_str = "\uF165"
let g:asrun_killed_str = "\uF0C8"
let g:asrun_presenting_str = "\uF927"

" Core Mappings
" Toggle quickfix for asyncrun with <F3>
noremap <silent> <F3> :call asyncrun#quickfix_toggle(8)<CR>
" Kill running async job with <F4>
noremap <F4> :call AsyncKill()<CR>

" Language specific

" Python
augroup PythonRunners
  autocmd!
  autocmd Filetype python nmap <silent> <buffer> <F5> <ESC>:w<CR>:AsyncRun -raw python "$(VIM_FILEPATH)"<CR>
  autocmd Filetype python xnoremap <silent> <buffer> <F5> :'<,'>AsyncRun -raw python<CR>
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
	AsyncRun -raw pandoc "$(VIM_FILEPATH)" -o %:p:r.pdf; xdg-open %:p:r.pdf; live-pandoc "$(VIM_FILEPATH)" -o %:p:r.pdf
endfunction

augroup MarkdownRunners
  autocmd!
  autocmd Filetype markdown map <silent> <buffer> <F5> <ESC>:w<CR>:call StartMarkdownHTMLPreview()<CR>
  autocmd Filetype markdown map <silent> <buffer> <F6> <ESC>:w<CR>:call StartMarkdownPDFPreview()<CR>
augroup END

" All the functions for managing the AsyncStatus
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


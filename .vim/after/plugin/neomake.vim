let g:neomake_running_str = "\uF252 "
let g:neomake_success_str = "\uF164 "
let g:neomake_failure_str = "\uF165 "

augroup neomake_hook
  au!
  autocmd User NeomakeJobFinished call NmJobFinished()
  autocmd User NeomakeJobStarted call NmJobStarted()
augroup END

let g:nm_job_status = ''
function! NmJobStarted() abort
  let g:nm_job_status = g:neomake_running_str
endfunction

function! NmJobFinished() abort
  let context = g:neomake_hook_context
  if context.jobinfo.exit_code == 0
    let g:nm_job_status = g:neomake_success_str
  endif
  if context.jobinfo.exit_code == 1
    let g:nm_job_status = g:neomake_failure_str
  endif
endfunction


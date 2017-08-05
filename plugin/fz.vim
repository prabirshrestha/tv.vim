function! s:exit_cb(job, st)
  if a:st != 0
    exe s:buf 'bwipe!'
    return
  endif
  call ch_close(job_getchannel(term_getjob(s:buf)))
  let files = readfile(s:tmp)
  call delete(s:tmp)
  if len(files) == 0
    return
  endif
  exe s:buf 'bwipe!'
  if len(files) == 1
    exe 'edit' files[0]
  else
    for file in files
      exe 'sp' file
    endfor
  endif
endfunction

function! s:quote(arg)
  if has('win32')
    return '"' . substitute(a:arg, '"', '\"', 'g') . '"'
  endif
  return "'" . substitute(a:arg, "'", "\\'", 'g') . "'"
endfunction

let s:fz_command = get(g:, 'fz_command', 'files -I FZ_IGNORE -A | gof')
function! s:fz()
  let $FZ_IGNORE = '(^|[\/])(\.git|\.hg|\.svn|\.settings|\.gitkeep|target|bin|node_modules|\.idea|^vendor)$|\.(exe|so|dll|png|obj|o|idb|pdb)$'
  let s:tmp = tempname()
  let s:buf = term_start(printf('%s %s %s > %s', &shell, &shellcmdflag, s:quote(s:fz_command), s:tmp), {'exit_cb': function('s:exit_cb')})
endfunction

command! Fz call s:fz()
nnoremap <Plug>(fz) :<c-u>Fz<cr>
if !hasmapto('<Plug>(fz)')
  nmap ,f <Plug>(fz)
endif

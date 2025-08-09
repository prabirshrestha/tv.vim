if exists('g:tv_loaded')
  finish
endif
let g:tv_loaded = 1

let g:tv_command = get(g:, 'tv_command', 'tv')
let g:tv_command_options_action = get(g:, 'tv_command_options_action', "--expect '%s'")
let g:tv_command_actions = {
  \ 'ctrl-o': 'edit',
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit'
  \ }

command! -nargs=* -complete=dir Tv call tv#run({'basepath': <q-args>})
nnoremap <Plug>(tv) :<c-u>Tv<cr>
if !hasmapto('<Plug>(tv)')
  nmap ,f <Plug>(tv)
endif

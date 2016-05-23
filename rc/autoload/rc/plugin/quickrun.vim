let g:rc#dein#plugins['thinca/vim-quickrun'] = {
\   'on_cmd': 'QuickRun',
\   'on_map': '<Plug>',
\   'hook_source': 'call rc#plugin#quickrun#hook_source()',
\   'hook_add': 'call rc#plugin#quickrun#hook_add()',
\ }

function! rc#plugin#quickrun#hook_source() abort
  let g:quickrun_no_default_key_mappings = 0
endfunction

function! rc#plugin#quickrun#hook_add() abort
  nmap ;qr <Plug>(quickrun)
  xmap ;qr <Plug>(quickrun)
  " nmap ;qr <Plug>(quickrun-op)
endfunction

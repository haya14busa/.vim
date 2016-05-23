let g:rc#dein#plugins['tyru/caw.vim'] = {
\   'on_map': '<Plug>',
\   'hook_source': 'call rc#plugin#caw#hook_source()',
\   'hook_add': 'call rc#plugin#caw#hook_add()',
\ }

function! rc#plugin#caw#hook_source() abort
  let g:caw_no_default_keymappings = 1
endfunction

function! rc#plugin#caw#hook_add() abort
  map gc <Plug>(caw:hatpos:toggle:operator)
  map gcc <Plug>(caw:hatpos:toggle)
endfunction


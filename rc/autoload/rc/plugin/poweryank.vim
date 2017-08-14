let g:rc#dein#plugins['haya14busa/vim-poweryank'] = {
\   'hook_source': 'call rc#plugin#poweryank#hook_source()',
\   'hook_add': 'call rc#plugin#poweryank#hook_add()',
\ }

function! rc#plugin#poweryank#hook_source() abort
endfunction

function! rc#plugin#poweryank#hook_add() abort
  map ;y <Plug>(operator-poweryank-osc52)
endfunction


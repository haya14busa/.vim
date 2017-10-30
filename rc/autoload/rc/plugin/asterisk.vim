let g:rc#dein#plugins['haya14busa/vim-asterisk'] = {
\   'hook_source': 'call rc#plugin#asterisk#hook_source()',
\   'hook_add': 'call rc#plugin#asterisk#hook_add()',
\ }

function! rc#plugin#asterisk#hook_source() abort
endfunction

function! rc#plugin#asterisk#hook_add() abort
  let g:asterisk#keeppos = 1
endfunction

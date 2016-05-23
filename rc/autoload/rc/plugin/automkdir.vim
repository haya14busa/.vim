let g:rc#dein#plugins['haya14busa/vim-auto-mkdir'] = {
\   'hook_add': 'call rc#plugin#quickrun#hook_add()',
\ }

function! rc#plugin#automkdir#hook_add() abort
  let g:automkdir#confirm = 0
endfunction

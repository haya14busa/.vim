let g:rc#dein#plugins['junegunn/fzf'] = {
\   'hook_source': 'call rc#plugin#fzf#hook_source()',
\   'hook_add': 'call rc#plugin#fzf#hook_add()',
\ }

function! rc#plugin#fzf#hook_source() abort
endfunction

function! rc#plugin#fzf#hook_add() abort
endfunction


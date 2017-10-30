" See is.vim
let g:rc#dein#plugins['osyo-manga/vim-anzu'] = {
\   'on_map': [['n', '<Plug>']],
\   'hook_source': 'call rc#plugin#anzu#hook_source()',
\   'hook_add': 'call rc#plugin#anzu#hook_add()',
\ }

function! rc#plugin#anzu#hook_source() abort
endfunction

function! rc#plugin#anzu#hook_add() abort
endfunction



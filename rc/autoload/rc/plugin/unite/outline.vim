let g:rc#dein#plugins['Shougo/unite-outline'] = {
\   'hook_add': 'call rc#plugin#unite#outline#hook_add()',
\ }

function! rc#plugin#unite#outline#hook_add() abort
  nnoremap <silent> ;o :<C-u>Unite
  \ -no-quit -keep-focus -no-start-insert
  \ -vertical -direction=botright -winwidth=60 outline<CR>
endfunction

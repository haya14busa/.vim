function! rc#plugin#asterisk#hook_source() abort
  let g:asterisk#keeppos = 1
endfunction

function! rc#plugin#asterisk#hook_add() abort
  map *  <Plug>(asterisk-z*)
  map g* <Plug>(asterisk-gz*)
  map #  <Plug>(asterisk-z#)
  map g# <Plug>(asterisk-gz#)
endfunction

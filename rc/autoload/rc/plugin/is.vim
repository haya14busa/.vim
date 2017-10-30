" See also incsearch.vim
let g:rc#dein#plugins['haya14busa/is.vim'] = {
\   'merged': 0,
\   'hook_source': 'call rc#plugin#is#hook_source()',
\   'hook_add': 'call rc#plugin#is#hook_add()',
\ }

function! s:is_search() abort
  return getcmdtype() =~# '[/\?]'
endfunction

function! rc#plugin#is#hook_source() abort
endfunction

function! rc#plugin#is#hook_add() abort
  if empty(dein#get('vim-anzu'))
    map n  <Plug>(is-n)
    map N  <Plug>(is-N)
  else
    map  n <Plug>(is-nohl-n)
    map  N <Plug>(is-nohl-N)
    nmap n <Plug>(is-nohl)<Plug>(anzu-n-with-echo)
    nmap N <Plug>(is-nohl)<Plug>(anzu-N-with-echo)
  endif

  if empty(dein#get('vim-asterisk'))
    map *  <Plug>(is-nohl-*)
    map g* <Plug>(is-nohl-g*)
    map #  <Plug>(is-nohl-#)
    map g# <Plug>(is-nohl-g#)
  else
    map *  <Plug>(asterisk-z*)<Plug>(is-nohl-1)
    map g* <Plug>(asterisk-gz*)<Plug>(is-nohl-1)
    map #  <Plug>(asterisk-z#)<Plug>(is-nohl-1)
    map g# <Plug>(asterisk-gz#)<Plug>(is-nohl-1)
  endif
endfunction


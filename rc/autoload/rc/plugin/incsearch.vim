function! rc#plugin#incsearch#hook_source() abort
  let g:incsearch#auto_nohlsearch = 1
  let g:incsearch#consistent_n_direction = 1
  let g:incsearch#do_not_save_error_message_history = 1
endfunction

function! rc#plugin#incsearch#hook_add() abort
  function! s:incsearch_config(...) abort
    return incsearch#util#deepextend(deepcopy({
    \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
    \   'keymap': {
    \     "\<C-l>": '<Over>(easymotion)'
    \   },
    \   'is_expr': 0
    \ }), get(a:, 1, {}))
  endfunction

  noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
  noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
  noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))
  omap /  <Plug>(incsearch-forward)
  omap ?  <Plug>(incsearch-backward)
  omap g/ <Plug>(incsearch-stay)

  noremap ;/ /
  noremap ;? ?

  map  n <Plug>(incsearch-nohl)<Plug>(anzu-n-with-echo)
  map  N <Plug>(incsearch-nohl)<Plug>(anzu-N-with-echo)
  map  n <Plug>(incsearch-nohl-n)
  map  N <Plug>(incsearch-nohl-N)
  nmap n <Plug>(incsearch-nohl)<Plug>(anzu-n-with-echo)
  nmap N <Plug>(incsearch-nohl)<Plug>(anzu-N-with-echo)
endfunction

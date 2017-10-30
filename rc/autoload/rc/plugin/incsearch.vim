" See also is.vim
let g:rc#dein#plugins['haya14busa/incsearch.vim'] = {
\   'on_map': '<Plug>',
\   'on_func': ['incsearch#go'],
\   'hook_source': 'call rc#plugin#incsearch#hook_source()',
\   'hook_add': 'call rc#plugin#incsearch#hook_add()',
\ }

let s:on_incsearch = { 'on_source': 'incsearch.vim' }

let g:rc#dein#plugins['haya14busa/incsearch-easymotion.vim'] = s:on_incsearch
let g:rc#dein#plugins['haya14busa/incsearch-migemo.vim'] = s:on_incsearch
let g:rc#dein#plugins['haya14busa/incsearch-fuzzy.vim'] = s:on_incsearch

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

  if !has('patch-8.0.1238')
    noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
    noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
    omap /  <Plug>(incsearch-forward)
    omap ?  <Plug>(incsearch-backward)
    noremap ;/ /
    noremap ;? ?
  endif

  noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))
  omap g/ <Plug>(incsearch-stay)
endfunction

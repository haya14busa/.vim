let g:rc#dein#plugins['rhysd/committia.vim'] = {
\   'on_ft': 'gitcommit',
\   'hook_add': 'call rc#plugin#committia#hook_add()',
\ }

function! rc#plugin#committia#hook_add() abort
  let g:committia_min_window_width = '140'
  let g:committia_hooks = {}
  function! g:committia_hooks.edit_open(info)
    setlocal spell
    " If no commit message, start with insert mode
    if getline(1) ==# ''
      startinsert
    end
  endfunction
endfunction


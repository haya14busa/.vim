let g:rc#dein#plugins['junegunn/fzf'] = {
\   'build': './install --all',
\   'hook_source': 'call rc#plugin#fzf#hook_source()',
\   'hook_add': 'call rc#plugin#fzf#hook_add()',
\ }

function! rc#plugin#fzf#hook_source() abort
endfunction

function! rc#plugin#fzf#hook_add() abort
  command! MRU call fzf#run({
  \  'source': v:oldfiles,
  \  'options': '-m +s',
  \  'down': '40%'
  \ ] })
endfunction


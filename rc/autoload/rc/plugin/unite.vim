let g:rc#dein#plugins['Shougo/unite.vim'] = {
\   'on_cmd': 'Unite',
\   'hook_source': 'call rc#plugin#unite#hook_source()',
\   'hook_add': 'call rc#plugin#unite#hook_add()',
\ }

function! rc#plugin#unite#hook_source() abort
  call unite#filters#matcher_default#use(['matcher_fuzzy'])
  call unite#filters#sorter_default#use(['sorter_rank'])

  " rc: edit rc files
  let g:unite_source_alias_aliases = {
  \   'rc' : {
  \     'source': 'file_rec/async',
  \     'args': g:vimrc_root . '/rc',
  \   },
  \ }
endfunction

function! rc#plugin#unite#hook_add() abort
  nnoremap ;u :<C-u>Unite source -start-insert<CR>
  nnoremap ;<Space> :<C-u>Unite file_rec/async:! -start-insert<CR>
  nnoremap ;r :<C-u>UniteResume<CR>
  nnoremap ;gr :<C-u>Unite -silent -no-quit grep/git:.<CR>
endfunction

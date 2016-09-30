let g:rc#dein#plugins['rhysd/unite-go-import.vim'] = {
\   'hook_add': 'call rc#plugin#unite#go_import#hook_add()',
\ }

function! rc#plugin#unite#go_import#hook_add() abort
  let g:unite_source_go_import_import_cmd = 'GoImport'
  augroup gopkgs
    autocmd!
    autocmd FileType go command! -buffer Import Unite go/import -start-insert
    autocmd FileType go command! -buffer Doc Unite go/import -default-action=godoc -start-insert
  augroup END
endfunction

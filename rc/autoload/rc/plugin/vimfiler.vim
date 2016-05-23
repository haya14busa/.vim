function! rc#plugin#vimfiler#hook_source() abort
  let g:vimfiler_as_default_explorer = 1
endfunction

function! rc#plugin#vimfiler#hook_add() abort
  let g:vimfiler_safe_mode_by_default = 0
  nnoremap <silent> ;vt :VimFilerBufferDir -tab<CR>
endfunction

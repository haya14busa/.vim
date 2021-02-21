function! rc#plugin#neocomplete#hook_source() abort
  " Use neocomplete.
  let g:neocomplete#enable_at_startup = 0

  " Use smartcase.
  let g:neocomplete#enable_smart_case = 1
  let g:neocomplete#enable_camel_case = 1
  let g:neocomplete#enable_underbar_completion = 1

  " Use fuzzy completion.
  let g:neocomplete#enable_fuzzy_completion = 1

  " Set minimum syntax keyword length.
  let g:neocomplete#sources#syntax#min_keyword_length = 3
  " Set auto completion length.
  let g:neocomplete#auto_completion_start_length = 2
  " Set manual completion length.
  let g:neocomplete#manual_completion_start_length = 0
  " Set minimum keyword length.
  let g:neocomplete#min_keyword_length = 3

  let g:neocomplete#disable_auto_select_buffer_name_pattern =
  \ '\[Command Line\]'

  inoremap <expr><C-e> pumvisible() ? neocomplete#cancel_popup() : "\<End>"
  inoremap <expr><C-l> neocomplete#complete_common_string()
endfunction

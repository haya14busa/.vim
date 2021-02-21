function! rc#plugin#neosnippet#hook_source() abort
  let g:neosnippet#enable_snipmate_compatibility = 1
  imap <C-k> <Plug>(neosnippet_expand_or_jump)
  smap <C-k> <Plug>(neosnippet_expand_or_jump)
  " xmap <C-k> <Plug>(neosnippet_expand_target)

  " SuperTab like snippets behavior.
  imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: pumvisible() ? "\<C-n>" : "\<TAB>"
  smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: "\<TAB>"

  let g:neosnippet#snippets_directory =
  \ g:vimrc_root . '/.dein/repos/hay14busa/haya14busa-snippets/neosnippets'

  " Set neosnippet competion length.
  " call neocomplete#custom#source('neosnippet', 'min_pattern_length', 1)
  " " prioratise snippet
  " call neocomplete#custom#source('neosnippet', 'rank', 400)
endfunction

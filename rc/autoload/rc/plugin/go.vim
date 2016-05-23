let g:rc#dein#plugins['fatih/vim-go'] = {
\   'on_ft': 'go',
\   'hook_source': 'call rc#plugin#go#hook_source()',
\ }

function! rc#plugin#go#hook_source() abort
  let g:go_bin_path = expand('~/.go/bin')
  let g:go_fmt_experimental = 1
  " let g:go#use_vimproc = 1
  let g:go_fmt_fail_silently = 1
  " let g:go_autodetect_gopath = 0
endfunction

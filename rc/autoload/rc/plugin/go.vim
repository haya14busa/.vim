let g:rc#dein#plugins['fatih/vim-go'] = {
\   'on_ft': 'go',
\   'hook_source': 'call rc#plugin#go#hook_source()',
\   'hook_add': 'call rc#plugin#go#hook_add()',
\ }

function! rc#plugin#go#hook_source() abort
  let g:go_bin_path = expand('~/.go/bin')
  let g:go_fmt_experimental = 1
  " let g:go#use_vimproc = 1
  let g:go_fmt_fail_silently = 1
  " let g:go_autodetect_gopath = 0
  let g:go_snippet_engine = 'neosnippet'
  let g:go_fmt_command = 'goimports'

  call s:add_path()
endfunction

function! rc#plugin#go#hook_add() abort
  augroup vim-go-quick-test
    autocmd!
    autocmd BufRead,BufNewFile *_test.go nnoremap <buffer> ;qr :GoTestFunc<CR>
  augroup END

  command! GoFmtS call s:gofmt_s()
endfunction

function! s:gofmt_s() abort
  let go_fmt_command_save = g:go_fmt_command
  let go_fmt_options_save = get(g:, 'go_fmt_options', '')
  let g:go_fmt_command = 'gofmt'
  let g:go_fmt_options = '-s'
  try
    GoFmt
  finally
    let g:go_fmt_command = go_fmt_command_save
    let g:go_fmt_options = go_fmt_options_save
  endtry
endfunction

function! s:add_path() abort
  if $GOPATH !=# ''
    execute 'set path+=' . $GOPATH . '/src'
  endif
  if executable('go')
    let root = system('go env GOROOT')[:-2]
    if root !=# ''
      execute 'set path+=' . root . '/src'
    endif
  endif
endfunction

let g:rc#dein#plugins['fatih/vim-go'] = {
\   'hook_source': 'call rc#plugin#go#hook_source()',
\   'hook_add': 'call rc#plugin#go#hook_add()',
\ }
" \   'on_ft': 'go',
" \   'on_path': '*.tmpl',

let g:rc#dein#plugins['haya14busa/vim-gofmt'] = {
\   'hook_source': 'call rc#plugin#go#fmt_hook_source()',
\   'hook_add': 'call rc#plugin#go#fmt_hook_add()',
\ }

function! rc#plugin#go#hook_source() abort
  let g:go_bin_path = expand('~/.go/bin')
  let g:go_fmt_experimental = 1
  let g:go_fmt_fail_silently = 1
  let g:go_snippet_engine = 'neosnippet'
  let g:go_fmt_command = 'goimports'
  let g:go_template_autocreate = 0
  let g:go_echo_go_info = 0
  let g:go_gocode_unimported_packages = 1

  call s:add_path()
endfunction

function! rc#plugin#go#hook_add() abort
  augroup vim-go-quick-test
    autocmd!
    autocmd BufRead,BufNewFile *_test.go nnoremap <buffer> ;qr :GoTestFunc<CR>
  augroup END

  augroup vim-go-text-tmpl
    autocmd!
    autocmd BufRead,BufNewFile *.tmpl set filetype=gotexttmpl
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

function! rc#plugin#go#fmt_hook_source() abort
endfunction

function! rc#plugin#go#fmt_hook_add() abort
  let g:go_fmt_autosave = 0 " disable auto gofmt by vim-go

  augroup vim-gofmt
    autocmd!
    autocmd BufWritePre *.go :Fmt
  augroup END

  let g:gofmt_formatters = [
  \   { 'cmd': 'gofmtrlx', 'args': ['-s', '-w'] },
  \   { 'cmd': 'goimports', 'args': ['-w'] },
  \ ]
  " \   { 'cmd': 'gotypeconv', 'args': ['-w'] },
  " \   { 'cmd': 'gofmt', 'args': ['-s', '-w'] },
  " \   { 'cmd': 'goiferr', 'args': ['-w'] },
endfunction

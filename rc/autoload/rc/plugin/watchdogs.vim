let g:rc#dein#plugins['osyo-manga/vim-watchdogs'] = {
\   'depends': ['vim-quickrun'],
\   'hook_source': 'call rc#plugin#watchdogs#hook_source()',
\   'hook_add': 'call rc#plugin#watchdogs#hook_add()',
\ }

if empty(get(g:rc#dein#plugins, 'jceb/vim-hier', {}))
  let g:rc#dein#plugins['jceb/vim-hier'] = {}
endif
if empty(get(g:rc#dein#plugins, 'dannyob/quickfixstatus', {}))
  let g:rc#dein#plugins['dannyob/quickfixstatus'] = {}
endif
if empty(get(g:rc#dein#plugins, 'osyo-manga/shabadou.vim', {}))
  let g:rc#dein#plugins['osyo-manga/shabadou.vim'] = {}
endif

function! rc#plugin#watchdogs#hook_source() abort
endfunction

function! rc#plugin#watchdogs#hook_add() abort
  let g:watchdogs_check_BufWritePost_enable = 1
  let g:watchdogs_check_BufWritePost_enables = {
  \   'go': 0,
  \   'vim': 0,
  \   'scala': 0,
  \   'typescript': 0,
  \ }
endfunction

function! rc#plugin#watchdogs#config() abort
  let c = {}
  let c['watchdogs_checker/_'] = {
  \   'runner' : 'job',
  \   'runner/job/interval' : 200,
  \   'outputter/quickfix/open_cmd' : '',
  \ }
  let c['go/watchdogs_checker'] = {
  \ 'type' : 'watchdogs_checker/golint',
  \}
  " \ 'type' : 'watchdogs_checker/gofmt',
  " go/vimlparser.go:3074:27: don't use underscores in Go names; method skip_white_and_colon should be skipWhiteAndColon
  " let c['watchdogs_checker/golint'] = {
  " \   "command" : "golint",
  " \   "exec"    : "%c %o %s:p",
  " \   "errorformat" : '%f:%l:%c: %m',
  " \ }
  return c
endfunction


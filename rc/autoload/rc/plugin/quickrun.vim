let g:rc#dein#plugins['thinca/vim-quickrun'] = {
\   'on_cmd': 'QuickRun',
\   'on_map': '<Plug>',
\   'hook_source': 'call rc#plugin#quickrun#hook_source()',
\   'hook_add': 'call rc#plugin#quickrun#hook_add()',
\ }

function! rc#plugin#quickrun#hook_source() abort
endfunction

function! rc#plugin#quickrun#hook_add() abort
  nmap ;qr <Plug>(quickrun)
  xmap ;qr <Plug>(quickrun)
  " nmap ;qr <Plug>(quickrun-op)

  let g:quickrun_no_default_key_mappings = 0

  let g:quickrun_config = {}

  let g:quickrun_config._ = {
  \   'runner' : 'job',
  \   'runner/job/interval' : 200,
  \ }

  " themis
  let plug = dein#get('vim-themis')
  if empty(plug)
    throw 'vim-themis not found'
  endif
  let themis_cmd = plug.path . '/bin/themis'
  let g:quickrun_config.vimspec = {
  \   'command' : themis_cmd,
  \   'cmdopt'  : '--runtimepath ".." --runtimepath ~/.vim/bundle/vital.vim --reporter dot',
  \   'exec'    : '%c %o %s:p | tr -d "\r"'
  \ }

  call extend(g:quickrun_config, rc#plugin#watchdogs#config())
endfunction

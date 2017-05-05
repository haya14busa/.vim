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

  call s:themis()

  let g:quickrun_config.javascript = {
  \   'type': 'javascript/nodejs',
  \ }

  call extend(g:quickrun_config, rc#plugin#watchdogs#config())
endfunction

function! s:themis() abort
  " themis
  let plug = dein#get('vim-themis')
  if empty(plug)
    throw 'vim-themis not found'
  endif

  let vital = dein#get('vital.vim')
  if empty(plug)
    throw 'vital.vim not found'
  endif

  let powerassert = dein#get('vital-power-assert')
  if empty(plug)
    throw 'vital-power-assert not found'
  endif

  let vimlcompiler = dein#get('vital-vimlcompiler')
  if empty(plug)
    throw 'vital-vimlcompiler not found'
  endif

  let safestring = dein#get('vital-safe-string')
  if empty(plug)
    throw 'vital-safe-string not found'
  endif

  let themis_cmd = plug.path . '/bin/themis'
  let cmdopt = join([
  \   '--reporter dot',
  \   '--runtimepath ".."',
  \   '--runtimepath ' . vital.rtp,
  \   '--runtimepath ' . powerassert.rtp,
  \   '--runtimepath ' . vimlcompiler.rtp,
  \   '--runtimepath ' . safestring.rtp,
  \ ], ' ')

  let g:quickrun_config.vimspec = {
  \   'command' : themis_cmd,
  \   'cmdopt'  : cmdopt,
  \   'exec'    : '%c %o %s:p | tr -d "\r"'
  \ }

endfunction

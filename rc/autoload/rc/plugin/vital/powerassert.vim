let g:rc#dein#plugins['haya14busa/vital-power-assert'] = {
\   'hook_add': 'call rc#plugin#vital#powerassert#hook_add()',
\ }

function! rc#plugin#vital#powerassert#hook_add() abort
  let g:__vital_power_assert_config = {
  \   '__debug__': 1,
  \ }

  command! -nargs=+ PowerAssert execute s:assert(expand("<sfile>"), <q-args>)
endfunction

function! s:def_in_as(path, cmdname) abort
  let cmd = printf("execute powerassert#define('%s')", a:cmdname)
  call s:execute_in_path(a:path, [cmd])
endfunction

function! s:execute_in_path(path, lines) abort
  let save_lines = readfile(a:path)
  try
    call writefile(a:lines, a:path)
    execute ':source' fnameescape(a:path)
  finally
    call writefile(save_lines, a:path)
    " reload buffer to void below warning
    "   WARNING: The file has been changed since reading it!!!
    "   Do you really want to write to it (y/n)?
    try
      call s:reload_buffer(a:path)
    catch /^Vim\%((\a\+)\)\=:E94:/
      " E94: No matching buffer for /tmp/v98zNmY/11
      " ignore this error for quickrun in unsaved buffer
    endtry
  endtry
endfunction

function! s:reload_buffer(path) abort
  let autoread_save = &autoread
  let &autoread = 1
  try
    execute 'silent' 'checktime' fnameescape(a:path)
  finally
    let &autoread = autoread_save
  endtry
endfunction

let s:cmdprefix = 'PowerAssertScriptLocal'

let s:i = 0
function! s:newcmdname() abort
  let s:i += 1 
  return s:cmdprefix . s:i
endfunction

function! s:del_current_cmd() abort
  let cmd = s:cmdprefix . s:i
  if exists(':' . cmd) is# 2
    execute 'delcommand' cmd
  endif
endfunction

function! s:assert(sfile, args) abort
  if !get(g:__vital_power_assert_config, '__debug__', 0)
    return ''
  endif
  if a:sfile is# ''
    throw 'PowerAssert: cannot use from Command-line'
  endif
  let path = s:sfile2path(a:sfile)
  if filewritable(path) isnot# 1
    throw 'PowerAssert: caller file is required to be writable: ' . path
  endif
  call s:del_current_cmd()
  let cmd = s:newcmdname()
  call s:def_in_as(path, cmd)
  return cmd . ' ' . a:args
endfunction

function! s:sfile2path(sfile) abort
  let pattern = '^function <SNR>\zs\d\+'
  if a:sfile =~# pattern
    let sid = matchstr(a:sfile, pattern)
    return s:sid2path(sid)
  else
    return fnamemodify(a:sfile, ':p')
  endif
endfunction

function! s:sid2path(sid) abort
  return vital#vital#import('Vim.ScriptLocal').sid2path(a:sid)
endfunction

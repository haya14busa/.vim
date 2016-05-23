let s:Process = vital#vital#import('System.Process')
let s:String = vital#vital#import('Data.String')

function! rc#utils#execute(args) abort
  let result = s:Process.execute(a:args)
  return s:String.chomp(result.output) is# 'true'
endfunction

function! rc#utils#is_in_git_repository() abort
  return rc#utils#execute(['git', 'rev-parse', '--is-inside-work-tree']) is# 'true'
endfunction

function! rc#utils#execute(args) abort
  let Process = vital#vital#import('System.Process')
  let String = vital#vital#import('Data.String')
  let result = Process.execute(a:args)
  return String.chomp(result.output)
endfunction

function! rc#utils#is_in_git_repository() abort
  return rc#utils#execute(['git', 'rev-parse', '--is-inside-work-tree']) is# 'true'
endfunction

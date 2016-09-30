let g:rc#dein#plugins['vim-jp/vital.vim'] = {
\   'merged': 0,
\   'on_cmd': 'Vitalize',
\   'on_func': ['vital#vital#of', 'vital#vital#import'],
\ }

let s:modules = [
\   'haya14busa/vital-vimlcompiler',
\   'haya14busa/vital-safe-string',
\ ]

for s:m in s:modules
  let g:rc#dein#plugins[s:m] = {}
endfor
unlet s:m

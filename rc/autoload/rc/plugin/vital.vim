let g:rc#dein#plugins['vim-jp/vital.vim'] = {
\   'merged': 0,
\ }
" \   'on_cmd': 'Vitalize',
" \   'on_func': ['vital#vital#of', 'vital#vital#import'],

let s:modules = [
\   'haya14busa/vital-vimlcompiler',
\   'haya14busa/vital-safe-string',
\   'haya14busa/vital-synblock',
\   'haya14busa/vital-string-converter',
\ ]

for s:m in s:modules
  let g:rc#dein#plugins[s:m] = { 'merged': 0 }
endfor
unlet s:m

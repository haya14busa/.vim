let g:rc#dein#plugins['itchyny/vim-extracmd'] = {
\   'hook_add': 'call rc#plugin#extracmd#hook_add()',
\ }

function! rc#plugin#extracmd#hook_add() abort
  call extracmd#set('a[ppend]', '')
  call extracmd#set('i[nsert]', '')
  call extracmd#set('waq', 'wqa')
  call extracmd#set('<silent>', 'w!!', 'w !sudo tee > /dev/null %')
  call extracmd#set('<silent>', 'scr[iptnames]', 'Capture scriptnames')
  call extracmd#set('<silent>', 'date', 'echo strftime("%Y-%m-%dT%H:%M:%S")')
  call extracmd#set('<silent>', 'syn', 'echo synIDattr(synID(line(''.''), col(''.''), 0), ''name'')')
endfunction

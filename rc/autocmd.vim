" :h last-position-jump
autocmd MyVimrc BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Resize splits when the window is resized
autocmd MyVimrc VimResized * :wincmd =

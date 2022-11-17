set nocompatible
filetype plugin on
syntax on


call plug#begin()
Plug 'junegunn/seoul256.vim'
call plug#end()

"Theme
" Unified color scheme (default: dark)

let g:seoul256_background = 234
colo seoul256
"colo seoul256-light

" Switch
set background=dark
"set background=light

syntax on

colorscheme desert

set number
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

filetype plugin indent on
set expandtab

set tabstop=2
set softtabstop=2

set shiftwidth=2

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

set noswapfile

" added by teo
" allow unsaved buffers to be backgrounded
set hidden
" toggle between the two most recently edited files
nmap <leader><leader> :edit #<CR>

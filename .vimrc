syntax on

colorscheme desert

set number
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

filetype plugin indent on
set expandtab

set tabstop=2
set softtabstop=2

" Activates bottom status bar
set laststatus=2
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" Make backspace work as in most other editors
set backspace=indent,eol,start

set shiftwidth=2

set ttimeout ttimeoutlen=50

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" Show trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

set noswapfile

" added by teo
" allow unsaved buffers to be backgrounded
set hidden
" toggle between the two most recently edited files
nmap <leader><leader> :edit #<CR>
set incsearch

" Remap arrow keys to prevent usage
nnoremap <left> :echohl ErrorMsg<Bar>echo "use h!"<Bar>echohl None<CR>
nnoremap <down> :echohl ErrorMsg<Bar>echo "use j!"<Bar>echohl None<CR>
nnoremap <up> :echohl ErrorMsg<Bar>echo "use k!"<Bar>echohl None<CR>
nnoremap <right> :echohl ErrorMsg<Bar>echo "use l!"<Bar>echohl None<CR>
inoremap <left> <nop>
inoremap <down> <nop>
inoremap <up> <nop>
inoremap <right> <nop>

" ctrlp configuration
let g:ctrlp_custom_ignore = '\v[\/](.git|.hg|.svn|_build|deps|node_modules|tmp)$'

" ale configuration
let g:ale_lint_delay = 1000
let g:ale_linters_explicit = 1
let g:ale_linters = {
\ 'elixir': ['credo'],
\ 'ruby': ['rubocop'],
\ 'javascript': ['eslint'],
\ 'scss': ['sass-lint']
\}

cnoremap %% <c-r>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>s :split %%
map <leader>v :vsplit %%
map <leader>t :tabedit %%
map <leader>r :read %%

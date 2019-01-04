syntax on

silent! colorscheme solarized

set background=light
set number
set lazyredraw

filetype plugin indent on
set expandtab

set tabstop=2
set softtabstop=2

" Split tabs to right and bottom
set splitbelow
set splitright

" Activates bottom status bar
set laststatus=2
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" Make backspace work as in most other editors
set backspace=indent,eol,start

set shiftwidth=2

set ttimeout ttimeoutlen=50

highlight ColorColumn ctermbg=LightGrey
highlight MatchParen cterm=underline,bold term=underline,bold ctermfg=33 ctermbg=NONE
set colorcolumn=81

highlight LineNr ctermfg=grey

set noswapfile

" system clipboard integration
nnoremap gy "*y
nnoremap gY "*y$
nnoremap gp "*p
nnoremap gP "*P

vnoremap gy "*y
vnoremap gp "*p
vnoremap gP "*P


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
vnoremap <left> :<C-U>echohl ErrorMsg<Bar>echo "use h!"<Bar>echohl None<CR>gv
vnoremap <down> :<C-U>echohl ErrorMsg<Bar>echo "use j!"<Bar>echohl None<CR>gv
vnoremap <up> :<C-U>echohl ErrorMsg<Bar>echo "use k!"<Bar>echohl None<CR>gv
vnoremap <right> :<C-U>echohl ErrorMsg<Bar>echo "use l!"<Bar>echohl None<CR>gv
inoremap <left> <nop>
inoremap <down> <nop>
inoremap <up> <nop>
inoremap <right> <nop>

" ale configuration
let g:ale_lint_delay = 100
let g:ale_linters_explicit = 1

" ale linter configuration
let g:ale_linters = {}
let g:ale_linters.elixir = ['credo']
let g:ale_linters.javascript = ['eslint']
let g:ale_linters.ruby = ['rubocop']
let g:ale_linters.scss = ['sass-lint']

let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace']}
let g:ale_fixers.elixir = ['mix_format']
let g:ale_fixers.javascript = ['eslint']
let g:ale_fixers.markdown = ['markdownfmt']
let g:ale_fixers.ruby = ['rubocop']

nnoremap df :ALEFix<cr>

cnoremap %% <c-r>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>s :split %%
map <leader>v :vsplit %%
map <leader>t :tabedit %%
map <leader>r :read %%

set grepprg=git\ grep\ -n

augroup ft_qf
  autocmd!

  autocmd FileType qf setlocal nowrap nonumber
augroup END

set nowildmenu
set wildmode=list:longest,list:full

let g:pick_height = 15
nmap <space><space> :call PickFile()<CR>
nmap <space>s :call PickFileSplit()<CR>
nmap <space>v :call PickFileVerticalSplit()<CR>
nmap <space>t :call PickFileTab()<CR>
nmap <space>b :call PickBuffer()<CR>

set list
set listchars=tab:\ \ ,trail:.,extends:>,precedes:<,nbsp:+

cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL

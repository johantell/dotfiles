au BufRead,BufNewFile *.ex,*.exs set filetype=elixir
au BufRead,BufNewFile *.eex,*.heex,*.leex,*.sface,*.lexs set filetype=eelixir
au BufRead,BufNewFile mix.lock set filetype=elixir
au BufRead,BufNewFile * call s:DetectElixir()

function! s:setf(filetype) abort
  let &filetype = a:filetype
endfunction

function! s:DetectElixir()
  if getline(1) =~ '^#!.*\<elixir\>'
    call s:setf('elixir')
  endif
endfunction

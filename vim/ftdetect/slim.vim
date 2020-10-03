au BufRead,BufNewFile *.slime,*.slim,*.slimleex call s:setf('slim')

function! s:setf(filetype) abort
  let &filetype = a:filetype
endfunction

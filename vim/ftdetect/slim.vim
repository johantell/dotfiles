au BufRead,BufNewFile *.slim,*.slimleex call s:setf('slime')

function! s:setf(filetype) abort
  let &filetype = a:filetype
endfunction

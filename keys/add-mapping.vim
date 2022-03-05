function! IndentDelimiters()
  let startStr = "\<CR>\<CR>\<ESC>"
  let endStr = "ki\<TAB>"
  let i=0
  let char=strpart(getline("."), i, 1)

  while char =~ '\s'
    let i+=1
    let char=strpart(getline("."), i, 1)
  endwhile

  let nbTab = i / 2
  let endStr = endStr . repeat("\<TAB>", nbTab)

  if strpart(getline('.'), col('.')-1, 1) == "}"
    return startStr . "<<" . endStr
  elseif strpart(getline('.'), col('.')-1, 1) == ")" || strpart(getline('.'), col('.')-1, 1) == "]"
    return startStr . endStr
  else
    return "\<CR>"
  endif
endf

function! RemoveDelimiters()
  let char = strpart(getline('.'), col('.')-1, 1)
  let previousChar = strpart(getline('.'), col('.')-2, 1)

  if char == ")" && previousChar == "(" || char == "]" && previousChar == "[" || char == "}" && previousChar == "{"
     return "\<RIGHT>\<BS>\<BS>"
  else
    return "\<BS>"
  endif
endf

function! CloseDelimiters(del)
  if strpart(getline('.'), col('.')-1, 1) == a:del
    return "\<RIGHT>"
  else
    return a:del
  endif
endf

function! SurroundWithQuotes()
    normal! bi"ea"
endfunction

function! CommentBlock()
    normal! om1om2`1O/*`2o*/
endfunction

function! NewLinesDown()
    normal! oo
    startinsert!
endfunction

function! NewLinesUp()
    normal! OO
    startinsert!
endfunction

nnoremap <leader>s" :call SurroundWithQuotes()<CR>
vnoremap <leader>/ :call CommentBlock()<CR>
nnoremap <leader>o :call NewLinesDown()<CR>
nnoremap <leader>O :call NewLinesUp()<CR>

" inoremap ( ()<LEFT>
" inoremap { {}<LEFT>
" inoremap [ []<LEFT>

" inoremap <expr> ) CloseDelimiters(')')
" inoremap <expr> } CloseDelimiters('}')
" inoremap <expr> ] CloseDelimiters(']')

" indent properly block delimiters after pressing enter
" inoremap <expr> <CR> IndentDelimiters()
" inoremap <expr> <BS> RemoveDelimiters()

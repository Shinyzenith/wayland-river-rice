" This file basically remaps some common pain points
fu! Single_quote(str)
  return "'" . substitute(copy(a:str), "'", "''", 'g') . "'"
endfu
fu! Cabbrev(key, value)
  exe printf('cabbrev <expr> %s (getcmdtype() == ":" && getcmdpos() <= %d) ? %s : %s',
    \ a:key, 1+len(a:key), Single_quote(a:value), Single_quote(a:key))
endfu

call Cabbrev('WQ', 'wq')
call Cabbrev('Wq', 'wq')
call Cabbrev('wQ', 'wq')

call Cabbrev('E', 'e')
call Cabbrev('Q', 'q')
call Cabbrev('W', 'w')

call Cabbrev('CD', 'cd')
call Cabbrev('Cd', 'cd')
call Cabbrev('cD', 'cd')

" Moving the cursor to where we left off in the file
autocmd BufRead * autocmd FileType <buffer> ++once
  \ if &ft !~# 'commit\|rebase' && line("'\"") > 1 && line("'\"") <= line("$") | exe 'normal! g`"' | endif

if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

nmap <buffer> <LocalLeader>r <Plug>FormatPython
nmap <buffer> <script> <Plug>FormatPython <SID>Format
nmenu <script> Plugin.Format\ Python <SID>Format
nmap <SID>Format :call <SID>Format()<CR>

function! s:Format()
  let pos = getpos('.')
  silent update
  silent %!yapf
  silent w
  call setpos('.', pos)
endfunction


command! -nargs=0 Format :call s:Format()

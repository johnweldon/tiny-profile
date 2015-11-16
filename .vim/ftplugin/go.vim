if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

" some unusual string to prevent a match
set errorformat=````````

nmap <buffer> <LocalLeader>r :GoImports<cr>

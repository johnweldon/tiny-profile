if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

nmap <buffer> <LocalLeader>r :GoImports<cr>

set guioptions=c
set guifont=Monospace\ 12

set columns=132
set lines=50

set vb t_vb=""

set background=dark


if has("gui_win32")
    set guifont=Source_Code_Pro:h12,Consolas:h12,Anonymous_Pro:h12,Envy_Code_R:h12,Lucida_Console:h12
    colorscheme koehler
elseif has("gui_macvim")
    set guifont=Monaco:h12,Menlo:h12,Andale_Mono:h12
    colorscheme macvim
elseif has("x11")
    set guifont=Monospace\ 12
    colorscheme koehler
else
    colorscheme vividchalk
endif


if filereadable(findfile("~/.local.gvimrc"))
    source ~/.local.gvimrc
endif

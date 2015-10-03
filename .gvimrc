
set guioptions=c

set columns=132
set lines=50

set vb t_vb=""

set background=dark


if has("gui_win32")
    set guifont=Source_Code_Pro:h14,Consolas:h14,Anonymous_Pro:h14,Envy_Code_R:h14,Lucida_Console:h14
    colorscheme koehler
elseif has("gui_macvim")
    set guifont=Monaco:h16,Menlo:h16,Andale_Mono:h16
    colorscheme macvim
elseif has("x11")
    set guifont="Ubuntu Mono 12"
    colorscheme koehler
else
    colorscheme vividchalk
endif


if filereadable(findfile("~/.local.gvimrc"))
    source ~/.local.gvimrc
endif

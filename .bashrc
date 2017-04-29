#!/usr/bin/env bash

# If not running interactively, don't do anything
case $- in
  *i*) ;;
    *) return ;;
esac

[ -f "${HOME}/.Xresources" ] && command -v xrdb >/dev/null 2>&1 && if [ "$DISPLAY" ]; then
  xrdb -merge "${HOME}/.Xresources" ;
fi

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


if [ -x /usr/bin/uname ]; then UNAME=/usr/bin/uname ; fi
if [ -x /bin/uname ]; then UNAME=/bin/uname ; fi

export SYSTEM=$(${UNAME} -s)
export HOST=$(${UNAME} -n)
export USER='missing'
command -v whoami >/dev/null 2>&1 && export USER=$(whoami)

# Source global definitions
for initfile in "${HOME}/.bash.aliases"\
                "${HOME}/.local.bashrc"
do
  if [ -f ${initfile} ]; then
    . ${initfile}
  fi
done


command set -o vi
command set -o ignoreeof
command set -o noclobber


[ -f "${HOME}/.lesskey" ] && lesskey

export LC_ALL="en_US.UTF-8" >/dev/null 2>&1
export LANG="en_US.UTF-8"

case $(realpath "$(command -v less)") in
  *busybox)
    export GIT_PAGER=
    export LESS=
    ;;
  *)
    export PAGER=less
    export LESS='-FeX2Rgmwz-2'
    ;;
esac

export LESSCHARSET='UTF-8'
export EDITOR='vi'
export VISUAL=${EDITOR}

if [ "X${SYSTEM}" == "XLinux" ]; then
  export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:'
  [ -x /usr/bin/lesspipe ] && export LESSOPEN='| /usr/bin/lesspipe %s'
  [ -x /usr/bin/lesspipe ] && export LESSCLOSE='/usr/bin/lesspipe %s %s'
else
  export CLICOLOR=TRUE
  export LSCOLORS=Gxfxbxdxcxegedabagacad
fi

function setprompt {
  local escon="\[\033["
  local escoff="\]"

  local fg_black="${escon}0;30m${escoff}"
  local fg_red="${escon}0;31m${escoff}"
  local fg_green="${escon}0;32m${escoff}"
  local fg_brown="${escon}0;33m${escoff}"
  local fg_blue="${escon}0;34m${escoff}"
  local fg_purple="${escon}0;35m${escoff}"
  local fg_cyan="${escon}0;36m${escoff}"
  local fg_lgray="${escon}0;37m${escoff}"
  local fg_dgray="${escon}1;30m${escoff}"
  local fg_lred="${escon}1;31m${escoff}"
  local fg_lgreen="${escon}1;32m${escoff}"
  local fg_yellow="${escon}1;33m${escoff}"
  local fg_lblue="${escon}1;34m${escoff}"
  local fg_lpurple="${escon}1;35m${escoff}"
  local fg_lcyan="${escon}1;36m${escoff}"
  local fg_lgray="${escon}1;37m${escoff}"

  local bg_black="${escon}0;40m${escoff}"
  local bg_red="${escon}0;41m${escoff}"
  local bg_green="${escon}0;42m${escoff}"
  local bg_brown="${escon}0;43m${escoff}"
  local bg_blue="${escon}0;44m${escoff}"
  local bg_purple="${escon}0;45m${escoff}"
  local bg_cyan="${escon}0;46m${escoff}"
  local bg_lgray="${escon}0;47m${escoff}"
  local bg_dgray="${escon}1;40m${escoff}"
  local bg_lred="${escon}1;41m${escoff}"
  local bg_lgreen="${escon}1;42m${escoff}"
  local bg_yellow="${escon}1;43m${escoff}"
  local bg_lblue="${escon}1;44m${escoff}"
  local bg_lpurple="${escon}1;45m${escoff}"
  local bg_lcyan="${escon}1;46m${escoff}"
  local bg_lgray="${escon}1;47m${escoff}"

  local fg_default="${escon}0;39m${escoff}"
  local bg_default="${escon}0;49m${escoff}"

  local promptstr='$ '
  if [ "X${UID}" == "X0" ]; then local promptstr=${fg_red}'# '${fg_default}; fi

  local user=${fg_lcyan}'$USER{'${fg_lpurple}'$UID'${fg_lcyan}'}'${fg_default}
  local host='@'${fg_green}'$HOST'${fg_default}
  local path=' ('${fg_yellow}'\w'${fg_default}')'

  local line1='\n'${user}${host}${path}${line2}
  local line2='\n'${fg_dgray}'\t [$?]('${fg_lgreen}${SHLVL}${fg_dgray}') '${promptstr}

  export PS1=${line1}${line2}${bg_default}${fg_default}
  export PS2=${fg_red}'+ '${fg_default}
}
setprompt

umask 002

case $(realpath "$(command -v grep)") in
  *busybox) ;;
  *grep) alias grep="grep --exclude-dir=.git --color=auto" ;;
  *) ;;
esac

if command -v vim > /dev/null 2>&1 ; then
  export EDITOR=vim
else
  export EDITOR=vi
  alias vim=vi
fi

#
# finally, clean up path
#

export PATH="${PATH}:${HOME}/bin:$(go env GOPATH)/bin"
if command -v cleanpath > /dev/null 2>&1 ; then
  export PATH=$(cleanpath -separator ':' $PATH)
  export GOPATH=$(cleanpath -separator ':' $GOPATH)
  export CDPATH=.:$(cleanpath -separator ':' $CDPATH)
else
  echo "Missing cleanpath"
fi


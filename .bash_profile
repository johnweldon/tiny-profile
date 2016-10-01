#!/usr/bin/env bash

export BASH_ENV="${HOME}/.bashrc"
if [ -f $BASH_ENV ]; then
  . $BASH_ENV
fi

# 
# final clean up of PATH
#

if [ "X${MSYSTEM}" == "XMINGW32" ]; then 
    # cygwin or msys - don't do the cleanpath operation because of wierd path variables
    exit
fi

command -v cleanpath >/dev/null 2>&1 && PATHPROC="$(command -v cleanpath)"
[[ -n "${PATHPROC}" ]] && { $(command -v cleanpath) >/dev/null 2>&1; if [ $? -ne 0 ] ; then PATHPROC=""; fi; }
[[ -z "${PATHPROC}" ]] && { echo "Warning: cleanpath missing"; echo "PATH=$PATH"; PATHPROC="echo"; }


export PATH=$( ${PATHPROC} "${HOME}/bin:${PATH}:/sbin:/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin")


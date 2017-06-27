#!/bin/bash

# saver pwd
REPODIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd ~
#rm -irf .emacs.d # hu errrr emmm...
if [ -f emacs.d ]; then
    # regular file
    mv emacs.d emacs.d_backup$(date "+%Y%m%dT%H%M%S")
elif [ -L emacs.d ]
    # direcory is a symlink
    ln -s $REPODIR/emacs.d .emacs.d  > /dev/null 2>&1
fi
ln -s $REPODIR/gnus .gnus  > /dev/null 2>&1
if [[ ! -f ~/.emacs.bak ]]; then
  if [[ -f .emacs ]]; then
    mv .emacs .emacs.bak
  fi
fi

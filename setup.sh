#!/bin/bash

# saver pwd
REPODIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd ~
rm -irf .emacs.d
ln -s $REPODIR/emacs.d .emacs.d  > /dev/null 2>&1
ln -s $REPODIR/gnus .gnus  > /dev/null 2>&1
if [[ ! -f ~/.emacs.bak ]]; then
  if [[ -f .emacs ]]; then
    mv .emacs .emacs.bak
  fi
fi

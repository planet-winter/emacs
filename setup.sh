#!/bin/bash

# saver pwd
REPODIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd ~
rm -irf .emacs.d	
ln -s $REPODIR/.emacs.d
ln -s $REPODIR/.gnus
mv .emacs .emacs.bak


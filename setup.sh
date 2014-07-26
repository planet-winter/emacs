#!/bin/bash

repodir=$(pwd)

cd ~
rm -irf .emacs.d	
ln -s $repodir/.emacs.d
mv .emacs .emacs.bak
#ln -s $repodir/.emacs

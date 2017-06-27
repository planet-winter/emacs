#!/bin/bash

# saver pwd
REPODIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

timestamp=$(date "+%Y%m%dT%H%M%S")


function save_symlink () {
    cd ~
    for target in $@; do
	#rm -irf .emacs.d # hu errrr emmm...
	if [ ! -L $target ]; then
            # not a symlink
	    if [ -f $target ] ;then
		mv $target ${target}_backup_${timestamp}
	    fi
	fi
        # could be a symlink to something else
        #  write or overwrite hidden symlink
        ln -s -f $REPODIR/$target $target  > /dev/null 2>&1
    
    done
}

save_symlink .emacs .emacs.d .gnus



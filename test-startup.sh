#!/bin/sh -e
if [ -n "$TRAVIS" ]; then
    # Make it look like this is ~/.emacs.d (needed for Emacs 24.3, at least)
    export HOME=$PWD/..
fi
echo "Attempting startup..."
${EMACS:=emacs} -nw --batch \
                --eval '(let ((debug-on-error t)
                              (url-show-status nil)
                              (user-init-file (expand-file-name ".emacs.d/init.el"))
                           (load-file user-init-file)
                           (run-hooks (quote after-init-hook)))'
echo "Startup successful"

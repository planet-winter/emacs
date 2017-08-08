# planet-emacs settings
[![Build Status](https://travis-ci.org/planet-winter/emacs.svg?branch=master)](https://travis-ci.org/planet-winter/emacs)

my emacs config featuring:

  * Ansible editing using yaml mode
  * elpy
  * ido-mode
  * per user included settings
  * undo tree modeb
  * yasnippets
  * far more and more...

## Setup

clone the repo 

    git clone https://gitlab.com/planet-winter/emacs.git

and execute

    install.sh

to install emacs binaries

then run:

    setup.sh

this will backup emacs.d and symlink your it to the cloned on
and install elpy python dependencies using pip.

the first time you start emacs, it will install some packages
that are best handled by the emacs package manager.

### bashrc

Add this to your .bashrc to always connect to a emacs server.
it will start one if not already running


  #
  # emacs settings
  #
  export ALTERNATE_EDITOR=zile
  
  emacs_bin=$(which emacs)
  emacsclient_bin=$(which emacsclient) 
  
  function emacsclient () {
      # try to connect to emacs server if not running start emacs as dameon
      #  and connect again. this makes it independent of the (emacs-server)
      #  stanza in emacs config
      if $emacsclient_bin --no-wait "$@" 2>/dev/null; then
          echo "opened file(s) in emacs server"
      else
          $emacs_bin --daemon "$@"
          $$emacsclient_bin --no-wait "$@"
      fi
  }
  
  function emacs () {
      emacsclient
  }
    
    
## Credits

Used https://github.com/magnars/.emacs.d as a starting point

## Author

Daniel Winter

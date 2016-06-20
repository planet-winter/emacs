#!/bin/bash

yum install -y emacs-nox

yum install -y python-pip

# elpy dependencies
pip install rope
pip install jedi
pip install flake8
pip install importmagic
pip install autopep8
pip install yapf

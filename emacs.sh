#!/bin/bash

# Copyright (C) 2020  David Arroyo Menéndez

# Author: David Arroyo Menéndez <davidam@gnu.org>
# Maintainer: David Arroyo Menéndez <davidam@gnu.org>

# This file is software with freedom of class; you can
# redistribute it and/or modify it  only for the working
# class under the terms of the Working Class License
# published by David Arroyo Menéndez.

# This file is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# Working Class License for more details.
# You should have received a copy of the Working Class License along
# with examples about Bash; see the file COPYING. If not, see

# <https://github.com/davidam/workingclasslicense>.

echo "Simple elisp print"
emacs -batch -Q -l davidam-functions.el -f davidam-print 

echo "Fibonacci!!!!"
emacs -batch -Q -l davidam-exercises.el -f davidam-fibonacci

echo "Multiply two numbers"
emacs -batch -Q -l davidam-exercises.el -f davidam-multiply-two

echo "Execute (+ 2 3)"
emacs -Q --batch --eval '(message (number-to-string(+ 2 3)))'

#!/bin/bash

# Copyright (C) 2020  David Arroyo Menéndez

# Author: David Arroyo Menéndez <davidam@gnu.org>
# Maintainer: David Arroyo Menéndez <davidam@gnu.org>

# This file is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3, or (at your option)
# any later version.

# This file is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with davidam; see the file LICENSE.  If not, write to
# the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor, 
# Boston, MA 02110-1301 USA,

echo "Simple elisp print"
emacs -batch -Q -l davidam-functions.el -f davidam-print 

echo "Fibonacci!!!!"
emacs -batch -Q -l davidam-exercises.el -f davidam-fibonacci

echo "Multiply two numbers"
emacs -batch -Q -l davidam-exercises.el -f davidam-multiply-two

echo "Execute (+ 2 3)"
emacs -Q --batch --eval '(message (number-to-string(+ 2 3)))'

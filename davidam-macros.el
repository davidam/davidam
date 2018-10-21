;; Copyright (C) 2018  David Arroyo Menéndez

;; Author: David Arroyo Menéndez <davidam@gnu.org>
;; Maintainer: David Arroyo Menéndez <davidam@gnu.org>

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor, 
;; Boston, MA 02110-1301 USA,

;; VERY SIMPLE MACROS

(defmacro ++ (x)
  `(setq ,x (1+ ,x)))
;; (setq foo 5)
;; (++ foo)

(defmacro square (X) `(* ,X ,X))
;; (square 4)

;; COMPARING TIMES AND MACROS

(defun fsquare (x) (* x x))
(defmacro square2 (X) `(let ((Temp ,X)) (* Temp Temp)))
;; (square2 4)
;; (macroexpand '(square2 9))
(require 'cl)
(benchmark-run (square2 4))
(benchmark-run (square 4))
(benchmark-run-compiled (square2 4))
(benchmark-run-compiled (square 4))


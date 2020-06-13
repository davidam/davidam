;; Copyright (C) 2018  David Arroyo Menéndez

;; Author: David Arroyo Menéndez <davidam@gnu.org>
;; Maintainer: David Arroyo Menéndez <davidam@gnu.org>

;; This file is software with freedom of class; you can
;; redistribute it and/or modify it  only for the working
;; class under the terms of the Working Class License
;; published by David Arroyo Menéndez.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; Working Class License for more details.
;; You should have received a copy of the Working Class License along
;; with examples about Emacs Lisp; see the file COPYING. If not, see

;; <https://github.com/davidam/workingclasslicense>.

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


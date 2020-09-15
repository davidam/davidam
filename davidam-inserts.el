;; Copyright (C) 2020  David Arroyo Menéndez

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

(defun davidam-insert-org-beamer-header(title author language description keywords)
  (interactive "sTitle: \nsAuthor: \nsLanguage: \nsDescription: \nsKeywords: ")
  (insert (concat "#+TITLE: " title "\n"))
  (insert (concat "#+AUTHOR: " author "\n"))
  (insert (concat "#+EMAIL: " user-mail-address "\n"))  
  (insert (concat "#+DATE: [" (format-time-string "%Y-%m-%d") "] \n"))
  (insert (concat "#+LANGUAGE: " language "\n"))
  (insert (concat "#+KEYWORDS: " keywords "\n"))
  (insert "#+LaTeX_CLASS: beamer \n")
  (insert "#+LaTeX_CLASS_OPTIONS: [presentation] \n")
  (insert "#+BEAMER_THEME: Madrid \n")
  (insert "#+COLUMNS: %45ITEM %10BEAMER_ENV(Env) %10BEAMER_ACT(Act) %4BEAMER_COL(Col) %8BEAMER_OPT(Opt) \n"))

(defun davidam-insert-bin(language)
  (interactive "sWrite a language (python2, python3, shell, bash, ruby): \n")
  (setq comment "#")
  (cond ((string-prefix-p "python" language)
	 (insert (concat comment "!/usr/bin/" language "\n"))
	 (insert (concat comment " -*- coding: utf-8 -*-\n")))
	((string= language "shell")
	 (insert "!/usr/bin/sh\n"))
	((string= language "bash")
	 (insert "!/usr/bin/sh\n"))
	((string= language "ruby")
	 (insert (concat comment "!/usr/bin/" language "\n"))
	 (insert "# coding: utf-8 \n"))))

 



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

(defun davidam-insert-org-header(title author language)
  (interactive "sTitle: \nsAuthor: \nsLanguage: \n")
  (insert (concat "#+TITLE: " title "\n"))
  (insert (concat "#+AUTHOR: " author "\n"))
  (insert (concat "#+EMAIL: " user-mail-address "\n"))
  (insert (concat "#+LANGUAGE: " language "\n"))
  (insert "#+HTML_HEAD: <link rel='stylesheet' type='text/css' href='../css/org.css' />\n"))
  
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

(defun davidam-insert-damegender-test(test)
  (interactive "sWrite damegender test\n")
  (insert (concat
	   "if ! cmp files/tests/" test ".txt files/tests/" test "-$(date \"+%Y-%m-%d-%H\").txt >/dev/null 2>&1 \n"))
  (insert "then \n")
  (insert "    echo \"" test " test is failing\"\n")
  (insert "else\n")
  (insert "    echo \"" test " test is ok\"\n")
  (insert "fi\n"))

(defun davidam-insert-copyright-note(language license name)
  (interactive "sLanguage: \nsLicense: \nsSoftware Name: \n")
  (setq comment "")
  (cond ((or (string-prefix-p language "sh") (string= language "bash") (string-prefix-p language "python"))
	 (setq comment "# "))
	((string= language "lisp")
	 (setq comment ";;"))
	((string= language "sql")
	 (setq comment "-- "))	
	((or (string= language "javascript") (string= language "js") (string= language "c"))
	 (setq comment "//")))
  (cond ((string= license "gplv3")
	 (insert (concat comment " Copyright (C) " (format-time-string "%Y") " " user-full-name "\n"))
	 (insert "\n")
	 (insert (concat comment " Author: " user-full-name " <" user-mail-address "> \n"))
	 (insert (concat comment " Maintainer: " user-full-name " <" user-mail-address "> \n"))
	 (insert (concat comment " This file is free software; you can redistribute it and/or modify\n"))
	 (insert (concat comment " it under the terms of the GNU General Public License as published by\n"))
	 (insert (concat comment " the Free Software Foundation; either version 3, or (at your option)\n"))
	 (insert (concat comment " any later version.\n"))
	 (insert (concat comment "\n"))
	 (insert (concat comment " This file is distributed in the hope that it will be useful,\n"))
	 (insert (concat comment " but WITHOUT ANY WARRANTY; without even the implied warranty of\n"))
	 (insert (concat comment " MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\n"))
	 (insert (concat comment " GNU General Public License for more details.\n"))
	 (insert (concat comment "\n"))
	 (insert (concat comment " You should have received a copy of the GNU General Public License\n"))
	 (insert (concat comment " along with " name "; see the file LICENSE.  If not, write to\n"))
	 (insert (concat comment " the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor, \n"))
	 (insert (concat comment " Boston, MA 02110-1301 USA,\n")))
	((string= license "fl")
	 (insert "You can share, copy and modify this software if you are a woman or you\n")
	 (insert (concat "are " user-full-name " and you include this note.\n")))))







		 
	 
	    

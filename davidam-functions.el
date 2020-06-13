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

;;; DATA STRUCTURES

;;(setq v [1 2 3 4]) 
(defun davidam-vector-to-list (v)
  (mapcar 'identity v)) 
;;(davidam-vector-to-list v)
  
;;; ORG FUNCTIONS

(defun davidam-org-agenda-timeline-all (&optional arg)
  (interactive "P")
  (with-temp-buffer
    (dolist (org-agenda-file org-agenda-files)
      (insert-file-contents org-agenda-file nil)
      (end-of-buffer)
      (newline))
    (write-file "/tmp/timeline.org")
    (org-agenda arg "L")))

(defun davidam-org-envolve-numbered-list()
  "Itemize some lines as a numbered list"
  (interactive)
  (setq num 1)
  (setq max (+ 1 (count-lines (point) (mark))))
  (if (> (point) (mark))
      (goto-line (+ 1 (count-lines 1 (mark))))
    (goto-line (+ 1 (count-lines 1 (point)))))
  (while (< num max)
    (move-beginning-of-line nil)
    (insert (concat (number-to-string num) ". "))
    (setq num (+ 1 num))
    (forward-line)))

(defun davidam-org-envolve-check-list()
  "Itemize some lines as a checked list"
  (interactive)
  (setq num 1)
  (setq max (+ 1 (count-lines (point) (mark))))
  (if (> (point) (mark))
      (goto-line (+ 1 (count-lines 1 (mark))))
    (goto-line (+ 1 (count-lines 1 (point)))))
  (while (< num max)
    (move-beginning-of-line nil)
    (insert (concat "+ [ ] "))
    (setq num (+ 1 num))
    (forward-line)))

(defun davidam-org-envolve-src(msg)
  "Envolve source between org tags"
  (interactive "sChoose your programming language: " msg)
  (if (string= "" msg)
      (setq msg "lisp"))
  (if (> (point) (mark))
      (progn 
	(goto-char (point))
	(insert "#+END_SRC")
	(goto-char (mark))
	(insert "#+BEGIN_SRC " msg "\n"))
    (progn
      (goto-char (point))
      (insert "#+BEGIN_SRC " msg "\n")
      (goto-char (mark))
      (insert "#+END_SRC"))))


(defun davidam-org-src(msg)
  "Insert org source tags"
  (interactive "sChoose your programming language: " msg)
;; TODO: Meter name en interactive. Ej: #+name: myconcat
  (if (equal nil msg) 
      (setq msg "lisp"))
  (insert "#+BEGIN_SRC " msg)
  (insert "\n#+END_SRC\n"))

(defun davidam-org-display-date ()
  (interactive)
  (setq item-time (org-get-scheduled-time (point)))
  (message "%s" item-time))

(defun davidam-org-todo-subtree (&optional ARG)
  "Change the state, such as org-todo, but for all the subtree"
  (interactive "P")
  (org-with-limited-levels (org-todo "DONE")))

;; XML

(defun davidam-xml-envolve(tag)
  "Envolve source between xml tags"
  (interactive "sChoose your tag: " tag)
  (if (string= "" tag)
      (message "You must write a tag")
    (if (> (point) (mark))
	(progn 
	  (goto-char (point))
	  (insert (concat "</" tag ">"))
	  (goto-char (mark))
	  (insert (concat "<" tag ">")))
      (progn
	(goto-char (point))
	(insert (concat "<" tag ">"))
	(goto-char (mark))
	(insert (concat "</" tag ">"))))))

;;; SHELL FUNCTIONS

(defun davidam-rsync-rmail ()
  (interactive)
  (get-buffer-create "rsync")
  (call-process "/home/davidam/scripts/rsync-rmail.sh" nil "rsync")
  (switch-to-buffer (get-buffer "rsync")))

(defun davidam-insert-output (command)
   (interactive "sCommand: ")
   (insert (shell-command-to-string command)))

(defun davidam-output-to-buffer (buffer command)
   (interactive "sBuffer name: \nsCommand: ")
   (get-buffer-create buffer)
   (call-process command nil buffer)
   (switch-to-buffer (get-buffer buffer)))

(defun davidam-today-is ()
  "Display current time."
  (interactive)
  (message (format-time-string "Today is %Y-%m-%d %T")))

(defun davidam-print()
  (interactive)
  (print "Hello shell"))


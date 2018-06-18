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

;; Exercises about An Introduction to Emacs Lisp.

(defun count-words-example (beginning end)
  "Imprime el número de palabras en la región."
  (interactive "r")
;;; 1. Configura condiciones apropiadas.
  (message "Contando palabras en la región ... ")
  (save-excursion
    (goto-char beginning)
;;; 2. Contar las palabras.
    (let ((count (recursive-count-words end)))
;;; 3. Enviar un mensaje al usuario.
      (cond ((zerop count)
	     (message
	      "La región no tiene palabras."))
	    ((= 1 count)
	     (message
	      "La región tiene 1 palabra."))
	    (t
	     (message
	      "La región tiene %d palabras." count))))))

(defun count-words-in-defun ()
  "Devuelve el número de palabras y símbolos en una defun"
  (beginning-of-defun)
  (let ((count 0)
	(end (save-excursion (end-of-defun) (point))))
    (while
	(and (< (point) end)
	     (re-search-forward
	      "\\(\\w\\|\\s_\\)+[^ \t\n]*[ \t\n]*"
	      end t))
      (setq count (1+ count)))
    count))

(defun count-words-defun ()
  "Devuelve el número de palabras y símbolos en una defun"
  (interactive)
  (message
   "Contando palabras y símbolos en la definición de función ... ")
  (let ((count (count-words-in-defun)))
    (cond
     ((zerop count)
      (message "La definición NO tiene palabras o símbolos."))
     ((= 1 count)
      (message "La definición tiene 1 palabra o símbolos."))
     (t
      (message "La definición tiene %d palabras o símbolos." count)))))

(defun find-file (filename)
  "Edita el fichero FILENAME. Cambia a un búffer visitando el fichero FILENAME, creando uno si no existe ya."
  (interactive "FFinding file: ")
  (switch-to-buffer (find-file-noselect filename)))

(defun lengths-list-file (filename)
  "Devuelve la lista de tamaños de definiciones con FILE.
La lista devuelta es una lista de números.
Cada número es el número de palabras o
símbolos en una definición."
  (interactive "Ffile: ")
  (message "Trabajando en %s ... " filename)
  (save-excursion
    (let ((buffer (find-file-noselect filename))
	  (lengths-list))
      (set-buffer buffer)
      (setq buffer-read-only t)
      (widen)
      (goto-char (point-min))
      (while (re-search-forward "^(defun" nil t)
	(setq lengths-list
	      (cons (count-words-in-defun) lengths-list)))
;;      (kill-buffer buffer)
      (message "Tamaño en palabras de las funciones: %s " lengths-list))))

(defun column-of-graph (max-graph-height actual-height)
  "Return list of strings that is one column of a graph."
  (let ((insert-list nil)
	(number-of-top-blanks
	 (- max-graph-height actual-height)))
  ;; Fill in asterisks.
    (while (> actual-height 0)
      (setq insert-list (cons "*" insert-list))
      (setq actual-height (1- actual-height)))
;; Fill in blanks.
    (while (> number-of-top-blanks 0)
      (setq insert-list (cons " " insert-list))
      (setq number-of-top-blanks
	    (1- number-of-top-blanks)))
;; Return whole list.
    insert-list))

;;(column-of-graph 3 2)



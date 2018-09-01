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

;; Useful exercises if you are reading An Introduction to Emacs Lisp.

(defun davidam-happy-birthday(person)
  (interactive "MWrite the person name: ")
  (message (concat "Happy birthday to you. Happy birthday to you. Happy birthday, dear " person ". Happy birthday to you")))

(defun davidam-fibonacci (n)
  (interactive "nEscribe un numero: " n)
  (message (number-to-string (fibonacci-aux n))))

 (defun fibonacci-aux (n)
;;  (interactive "dEscribe un numero: " n)
  (if (or (= n 0) (= n 1))
      1
    (+ (fibonacci-aux (- n 1)) (fibonacci-aux (- n 2)))))

(defun davidam-torres-de-hanoi (discos)
  (interactive "nDime tus discos y te digo cuantos pasos tienes que dar: " discos)
  (message (number-to-string (torres-de-hanoi-aux discos))))

(defun torres-de-hanoi-aux (discos)
  (if (= discos 1)
      1
    (+ 1 (* 2 (torres-de-hanoi-aux (- discos 1))))))

(defun davidam-multiply-two (number1 number2)
  (interactive "nNumber 1: \nnNumber 2: " number1 number2)
  (message "The result is %d" (* number1 number2)))

(defun davidam-triangle-using-dotimes (number-of-rows)
  "Using dotimes, add up the number of pebbles in a triangle."
  (interactive "nNumber of rows: " number-of-rows) 
  (let ((total 0))  ; otherwise a total is a void variable
    (dotimes (number number-of-rows total)
      (setq total (+ total (1+ number))))
    (message "Number of pebbles: %d" total)))

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

(defun group-number (num &optional size char)
    "Format NUM as string grouped to SIZE with CHAR."
    ;; Based on code for `math-group-float' in calc-ext.el
    (let* ((size (or size 3))
           (char (or char ","))
           (str (if (stringp num)
                    num
                  (number-to-string num)))
            ;; omitting any trailing non-digit chars
            ;; NOTE: Calc supports BASE up to 36 (26 letters and 10 digits ;)
           (pt (or (string-match "[^0-9a-zA-Z]" str) (length str))))
      (while (> pt size)
        (setq str (concat (substring str 0 (- pt size))
                          char
                          (substring str (- pt size)))
              pt (- pt size)))
      str))

;;(group-number 299792458)

;;(group-number "149597870691" 4 " ")


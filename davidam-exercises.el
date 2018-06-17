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

;; (defun files-in-below-directory (directory)
;;   "Lista los ficheros .el en DIRECTORIO y en sus subdirectorios."
;; ;; Aunque la función será usada no interactivamente,
;; ;; será fácil chequear si lo hacemos interactivo.
;; ;; El directorio tendrá un nombre tal como
;; ;; "/usr/local/share/emacs/22.1.1/lisp/"
;;   (interactive "DNombre del Directorio: ")
;;   (let (el-files-list
;; 	(current-directory-list
;; 	 (directory-files-and-attributes directory t)))
;;     ;; mientras estamos en el directorio actual
;;     (while current-directory-list
;;       (cond
;; ;; chequee para ver si el nombre del fichero finaliza en ‘.el’
;; ;; y si es así, añade su nombre a una lista.
;;        ((equal ".el" (substring (car (car current-directory-list)) -3))
;; 	(setq el-files-list
;; 	      (cons (car (car current-directory-list)) el-files-list)))
;; ;; chequee si el nombre del fichero es un directorio
;;        ((eq t (car (cdr (car current-directory-list))))
;; ;; decide si salir o hacer recursión
;; 	(if
;; 	    (equal "."
;; 		   (substring (car (car current-directory-list)) -1))
;; 	    ;; entonces no hagas nada puesto que el nombre del fichero es
;; 	    ;; el actual directorio o padre, "." o ".."
;; 	    ()
;; 	  ;; else desciende dentro del directorio y repite el proceso
;; 	  (setq el-files-list
;; 		(append
;; 		 (files-in-below-directory
;; 		  (car (car current-directory-list)))
;; 		 el-files-list)))))
;;       ;; mueve al siguiente fichero en la lista; esto también
;;       ;; ordena la lista así mientras el bucle
;;       ;; eventualmente llega a un fin
;;       (setq current-directory-list (cdr current-directory-list)))
;;     ;; devuelve los ficheros
;;     el-files-list))

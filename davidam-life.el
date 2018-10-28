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

;; A full program with a good hacker tradition
;; More information in http://www.davidam.com/docu/life.html

(setq table-example '((1 1 0 1) 
                      (0 1 0 1) 
                      (0 0 0 0) 
                      (0 1 0 0)))

(defun print-matrix (matrix)
  (interactive)
  (setq size (length matrix))
  (insert "\n")
  (dotimes (i size)
    (if (/= i 0) (insert "\n"))
    (dotimes (j size)
      (insert (format "%d " (elt (elt matrix i) j)))))
  (insert "\n"))

(defun neighborhoods (i j matrix)
"Receives the position and the matrix and returns how many neighborhoods there are"
  (interactive)
  (let ((size (length matrix)))
    (cond 
     ;; corners
     ((and (= i 0) (= j 0)) (+ 0 (elt (elt matrix 0) 1) (elt (elt matrix 1) 0) (elt (elt matrix 1) 1)))
     ((and (= i 0) (= j (- size 1))) (+ 0 (elt (elt matrix 0) (- size 2)) (elt (elt matrix 1) (- size 2)) (elt (elt matrix 1) (- size 1))))
     ((and (= i (- size 1)) (= j 0)) (+ 0 (elt (elt matrix (- size 2)) 0) (elt (elt matrix (- size 2)) 1) (elt (elt matrix (- size 1)) 1)))
     ((and (= i (- size 1)) (= j (- size 1))) (+ 0 (elt (elt matrix (- i 1)) (- j 1)) (elt (elt matrix (- i 1)) j) (elt (elt matrix i) (- j 1))))
     ;; awns
     ((and (= i 0) (> j 0) (not (= j (- size 1)))) (+ (elt (elt matrix 0) (+ j 1)) (elt (elt matrix 0) (- j 1)) (elt (elt matrix 1) (+ j 1)) (elt (elt matrix 1) j) (elt (elt matrix 1) (- j 1)))) ;; superior probada
     ((and (not (= i (- size 1))) (> i 0) (= j 0)) (+ (elt (elt matrix (+ i 1)) 0) (elt (elt matrix (- i 1)) 0) (elt (elt matrix (+ i 1)) 1) (elt (elt matrix i) 1) (elt (elt matrix (- i 1)) 1))) ;; izquierda probada
     ((and (= i (- size 1)) (> j 0) (not (= j (- size 1)))) (+ (elt (elt matrix (- i 1)) (- j 1)) (elt (elt matrix (- i 1)) j) (elt (elt matrix (- i 1)) (+ j 1)) (elt (elt matrix i) (- j 1)) (elt (elt matrix i) (+ j 1)))) ;; inferior (probada)
     ((and (not (= i (- size 1))) (> i 0) (= j (- size 1))) (+ (elt (elt matrix (- i 1)) (- j 1)) (elt (elt matrix (- i 1)) j) (elt (elt matrix i) (- j 1)) (elt (elt matrix (+ i 1)) j))) ;; derecha (probada)
     ;; rest
     ((and (not (= i 0)) (not (= j 0)) (not (= i (- size 1))) (not (= j (- size 1)))) (+ 0 (elt (elt matrix (- i 1)) (- j 1)) (elt (elt matrix (- i 1)) j) (elt (elt matrix (- i 1)) (+ j 1)) (elt (elt matrix i) (- j 1)) (elt (elt matrix i) (+ j 1)) (elt (elt matrix (+ i 1)) (- j 1)) (elt (elt matrix (+ i 1)) j) (elt (elt matrix (+ i 1)) (+ j 1))))
     )))

(defun comway-rules (i j table)
  (interactive)
  (cond ((and (= 1 (elt (elt table i) j)) (< 2 (neighborhoods i j table)) 0))
                            ((and (= 1 (elt (elt table i) j)) (or (= 2 (neighborhoods i j table)) (= 3 (neighborhoods i j table)))) 1)
                            ((and (= 1 (elt (elt table i) j)) (< 3 (neighborhoods i j table))) 0)
                            ((and (= 0 (elt (elt table i) j)) (= 3 (neighborhoods i j table))) 1)
                            (t (elt (elt table i) j))
                            ))

(defun apply-comway-rules-list (table)
  (interactive)
  (setq table-res nil)
  (dotimes (i (length table))
     (setq list-res nil)
     (dotimes (j (length (elt table i)))
       (setq list-res (cons (comway-rules i j table) list-res)))
     (setq table-res (cons list-res table-res)))
  table-res
  )

(defun comway-life(table gen)
  (interactive "NNumber of generations: \n" gen)
  (setq table-ej '((1 1 0 1) (0 1 0 1) (0 0 0 0) (0 1 0 0)))
  (if (eq table-ej nil)
      (setq table table-ej))
  (dotimes (i gen)
    (insert (format "\nGeneration %d\n-------------" i))
    (print-matrix table)
    (setq table (apply-comway-rules-list table))))



;; (comway-life table-example 14)

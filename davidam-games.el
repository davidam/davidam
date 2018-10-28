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

;; A full program about basis in games theory
;; More information in http://www.davidam.com/docu/nash.html

;;                               PLAYER 1            PLAYER 2
;;                         Stone  Paper  Scissor
(setq stonePaperScissor '(
                          ((0 0)  (1 -1) (-1 1))     ;; Stone
                          ((-1 1) (0 0)  (1 -1))     ;; Paper
                          ((1 -1) (-1 1) (0 0))))    ;; Scissor

(defun profit (i j player game)
  (interactive)
  (elt (elt (elt game i) j) player))

;; (profit 0 0 0 stonePaperScissor)

(defun equilibrium (i j player game)
  (interactive)
  ;; corners in the matrix
  (cond 
    ((and (= i 0) (= j 0))
     (and (>= 0 (- (profit (+ i 1) j player game)
                 (profit i j player game)))
         (>= 0 (- (profit i (+ j 1) player game)
                 (profit i j player game)))))
    ((and (= i (- (length game) 1)) (= j 0))
     (and (>= 0 (- (profit (- i 1) j player game)
                 (profit i j player game)))
         (>= 0 (- (profit i (+ j 1) player game)
                 (profit i j player game)))))
    ((and (= i 0) (= j (- (length game) 1)))
     (and (>= 0 (- (profit (+ i 1) j player game)
                 (profit i j player game)))
         (>= 0 (- (profit i (- j 1) player game)
                 (profit i j player game)))))
    ((and (= i (- (length game) 1)) (= j (- (length game) 1)))
     (and (>= 0 (- (profit (- i 1) j player game)
                 (profit i j player game)))
         (>= 0 (- (profit i (- j 1) player game)
                 (profit i j player game)))))
    ;; awns 
    ((and (= i 0) (> j 0) (not (= j (- (length game) 1))))  ;; left
     (and (>= 0 (- (profit (+ i 1) j player game)
                 (profit i j player game)))
         (>= 0 (- (profit i (- j 1) player game)
                 (profit i j player game)))
         (>= 0 (- (profit i (+ j 1) player game)
                 (profit i j player game)))))
    ((and (= i (- (length game) 1)) (> j 0) (not (= j (- (length game) 1)))) ;; right
     (and (>= 0 (- (profit (- i 1) j player game)
                 (profit i j player game)))
         (>= 0 (- (profit i (- j 1) player game)
                 (profit i j player game)))
         (>= 0 (- (profit i (+ j 1) player game)
                 (profit i j player game)))))
    ((and (= j 0) (> i 0) (not (= i (- (length game) 1)))) ;; down
     (and (>= 0 (- (profit (+ i 1) j player game)
                 (profit i j player game)))
         (>= 0 (- (profit (- i 1) j player game)
                 (profit i j player game)))
         (>= 0 (- (profit i (+ j 1) player game)
                 (profit i j player game)))))
    ((and (= j (- (length (elt game 0)) 1)) (> i 0) (not (= i (- (length game) 1)))) ;; up
     (and (>= 0 (- (profit (+ i 1) j player game)
                 (profit i j player game)))
         (>= 0 (- (profit (- i 1) j player game)
                 (profit i j player game)))
         (>= 0 (- (profit i (- j 1) player game)
                 (profit i j player game)))))
;; rest
    ((and (> j 0) (> i 0) (not (= i (- (length game) 1))) (not (= j (- (length game) 1)))) ;; left
     (and (>= 0 (- (profit (+ i 1) j player game)
                 (profit i j player game)))
         (>= 0 (- (profit (- i 1) j player game)
                 (profit i j player game)))
         (>= 0 (- (profit i (+ j 1) player game)
                 (profit i j player game)))
         (>= 0 (- (profit i (- j 1) player game)
                 (profit i j player game)))))
))
;;              i j player game
;; (equilibrium 0 1 0 stonePaperScissor) OK Equilibrio
;; (equilibrium 0 2 1 stonePaperScissor) OK Equilibrio
;; (equilibrium 1 0 1 stonePaperScissor) OK Equilibrio  
;; (equilibrium 1 2 0 stonePaperScissor) OK Equilibrio
;; (equilibrium 2 0 0 stonePaperScissor) OK Equilibrio 
;; (equilibrium 2 1 1 stonePaperScissor) OK Equilibrio


;; NON COOPERATIVE GAMES

(setq priviliged '( ;; Cooperate  Defraud
                       ((3 3)     (1 2))    ;; Cooperation
                       ((2 1)     (0 0))    ;; Defraud
                       ))

;;              i j player game
;; (equilibrium 0 0 0 priviliged) OK Equilibrium
;; (equilibrium 0 0 1 priviliged) OK Equilibrium

;; NON COOPERATIVE GAMES: Prisioner's Dilemma

(setq prisioner '( ;; Cooperate  Defraud
                       ((2 2)     (0 3))    ;; Cooperation
                       ((3 0)     (1 1))    ;; Defraud
                       ))
;;              i j player game
;; (equilibrium 1 0 0 prisioner) OK Equilibrium
;; (equilibrium 0 1 1 prisioner) OK Equilibrium

;; NON COOPERATIVE GAMES: Security Game

(setq security '( ;; Cooperate  Defraud
                       ((3 3)     (0 2))    ;; Cooperation
                       ((2 0)     (1 1))    ;; Defraud
                       ))
;;              i j player game
;; (equilibrium 0 0 0 security) OK Equilibrium
;; (equilibrium 0 0 1 security) OK Equilibrium

;; NON COOPERATIVE GAMES: Chicken

(setq chicken '( ;; Cooperate  Defraud
                       ((2 2)     (1 3))    ;; Cooperation
                       ((3 1)     (0 0))    ;; Defraud
                       ))
;;              i j player game
;; (equilibrium 0 1 1 chicken) OK Equilibrium
;; (equilibrium 1 0 0 chicken) OK Equilibrium


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


(require 'erc)

(setq erc-autojoin-channels-alist
      '(
;;	("localhost" "&bitlbee")
	("freenode.net" "#emacs-es" "#ourproject" "#emacs" "#grimoirelab" "#libresoft" "#ubuntu-women")
))

;;(setq erc-join-buffer 'bury)

(setq erc-user-full-name "David Arroyo Menéndez")
(setq erc-nick "davidam")
(setq erc-message-english-QUIT "%n (%u@%h) se fue: %r")
(setq erc-default-coding-system '(latin-1 . latin-1))
(setq erc-server-history-list '("irc.freenode.net"))

;;                                 "localhost")) ;; only for bitlbee

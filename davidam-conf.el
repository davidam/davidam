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

(tool-bar-mode 0)
(menu-bar-mode 0)
(column-number-mode 1)
(show-paren-mode)
(display-battery-mode)
(set-face-attribute 'default nil :height 160) ;; font-size

;; PERSONAL DATA
(setq user-full-name "David Arroyo Menéndez")
(setq user-mail-address "davidam@gmail.com")
(put 'upcase-region 'disabled nil)

;; TO COLLAPSE FUNCTIONS
(outline-minor-mode) ;; You can use it with: M-x hide-sublevels, M-x hide-others, M-x show-subtree, M-x hide-subtree, M-x show-all

;; AUTOCOMPLETE
;;(load "/home/davidam/git/popup-el/popup.el")
;;(load "/home/davidam/git/auto-complete/auto-complete.el")

;; RUBY
(add-to-list 'auto-mode-alist
	     '("\\.\\(?:cap\\|gemspec\\|irbrc\\|gemrc\\|rake\\|rb\\|ru\\|thor\\)\\'" . ruby-mode))

(add-to-list 'auto-mode-alist
	                    '("\\(?:Brewfile\\|Capfile\\|Gemfile\\(?:\\.[a-zA-Z0-9._-]+\\)?\\|[rR]akefile\\)\\'" . ruby-mode))

;;; ERC





;; PYTHON
(add-hook 'python-mode-hook
	    (lambda ()
		    (setq-default indent-tabs-mode t)
		    (setq-default tab-width 4)
		    (setq-default py-indent-tabs-mode t)
	    (add-to-list 'write-file-functions 'delete-trailing-whitespace)))

;; (org-babel-do-load-languages
;;  'org-babel-load-languages
;;  '((python . t)
;;    (sh . t)
;;    (sql . t)))

;; DRUPAL
;; (setq drupal-el-path "~/bzr/drupal-el/")
;; (load (concat drupal-el-path "drupal.el"))

;; ORG-MODE
(load "~/git/org-mode/contrib/lisp/org-license.el")
(load "~/git/org-mode/contrib/lisp/org-effectiveness.el")
(load "~/git/davidam/davidam-skeletons.el")
(load "~/git/davidam/davidam-inserts.el")
(load "~/git/davidam/davidam-functions.el")
(setq org-agenda-files '("~/TODO.org.gpg" "~/git/davidam.github.io/emacs/public.org"))

;; ORG & YOUTUBE
(defvar yt-iframe-format
  ;; You may want to change your width and height.
  (concat "<iframe width=\"440\""
          " height=\"335\""
          " src=\"https://www.youtube.com/embed/%s\""
          " frameborder=\"0\""
          " allowfullscreen>%s</iframe>"))

(org-add-link-type
 "yt"
 (lambda (handle)
   (browse-url
    (concat "https://www.youtube.com/embed/"
            handle)))
 (lambda (path desc backend)
   (cl-case backend
     (html (format yt-iframe-format
                   path (or desc "")))
     (latex (format "\href{%s}{%s}"
                    path (or desc "video"))))))


;;;; PO-MODE ;;;;
(require 'po-mode)
(defun iacute()
  (interactive)
  (insert "@'{@dotless{i}}"))
;; El atajo C-i insertará i acentuada, a la manera nativa de texinfo
(define-key po-subedit-mode-map "\C-i" 'iacute)

(defun egne()
  (interactive)
  (insert "@~n"))
;; El atajo C-n insertará eñe, a la manera nativa de texinfo
(define-key po-subedit-mode-map "\C-n" 'egne)



;; Debe cortar las líneas automáticamente
(add-hook 'po-subedit-mode-hook 'auto-fill-mode)

;;;; ASPELL ;;;;
;; Para que avise
(setq ispell-program-name "aspell" ispell-extra-args '("--lang=es"))
(add-hook 'po-subedit-mode-hook
	  (lambda()
	    (flyspell-mode 1)))

;;;; Dictionary ;;;;
(global-set-key "\C-cs" 'dictionary-search)
(global-set-key "\C-cm" 'dictionary-match-words)


;;;; Packaging Stuff ;;;;
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

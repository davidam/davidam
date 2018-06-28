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

(tool-bar-mode 0)
(menu-bar-mode 0)
(show-paren-mode)
(display-battery-mode)

;; PERSONAL DATA
(setq user-full-name "David Arroyo Menendez")
(setq user-mail-address "davidam@gnu.org")
(put 'upcase-region 'disabled nil)

;; TO COLLAPSE FUNCTIONS
(outline-minor-mode) ;; You can use it with: M-x hide-sublevels, M-x hide-others, M-x show-subtree, M-x hide-subtree, M-x show-all

;; AUTOCOMPLETE
(load "/home/davidam/git/popup-el/popup.el")
;;(load "/home/davidam/git/auto-complete/auto-complete.el")

;; RUBY
(add-to-list 'auto-mode-alist
	     '("\\.\\(?:cap\\|gemspec\\|irbrc\\|gemrc\\|rake\\|rb\\|ru\\|thor\\)\\'" . ruby-mode))

(add-to-list 'auto-mode-alist
	                    '("\\(?:Brewfile\\|Capfile\\|Gemfile\\(?:\\.[a-zA-Z0-9._-]+\\)?\\|[rR]akefile\\)\\'" . ruby-mode))

;; PYTHON
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)))

;; DRUPAL
;; (setq drupal-el-path "~/bzr/drupal-el/")
;; (load (concat drupal-el-path "drupal.el"))

;; ORG-MODE	
(load "~/git/org-mode/contrib/lisp/org-license.el")
(load "~/git/org-mode/contrib/lisp/org-effectiveness.el")
(setq org-agenda-files '("~/TODO.org.gpg" "~/git/davidam.github.io/emacs/public.org"))

;;;; PO-MODE ;;;;
(require 'po-mode)
(defun iacute()
(interactive)
(insert "@'{@dotless{i}}"))
;; El atajo C-i insertará i acentuada, a la manera nativa de texinfo
(define-key po-subedit-mode-map "\C-i" 'iacute)

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

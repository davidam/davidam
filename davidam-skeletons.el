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

(define-skeleton davidam-org-bibliography
  "A skeleton to bibliography for org-mode"
  ""
  '(setq author (skeleton-read "Author (Surname, Initials): ")) \n
  '(setq year (skeleton-read "Year: ")) \n 
  '(setq title (skeleton-read "Title: ")) \n
  '(setq publisher (skeleton-read "Publisher: ")) \n
  '(setq pages (skeleton-read "Pages Number: ")) \n
  > "+ " author " (" year "). " "\"/" title "/\" " publisher ". pp " pages "." \n
)

(define-skeleton davidam-org-bibliography-url
  "A skeleton to bibliography for org-mode"
  ""
  '(setq author (skeleton-read "Author (Surname, Initials): ")) \n
  '(setq year (skeleton-read "Year: ")) \n 
  '(setq date-seen (skeleton-read "Date seen: ")) \n 
  '(setq title (skeleton-read "Title: ")) \n
  '(setq publisher (skeleton-read "Publisher: ")) \n
  '(setq url (skeleton-read "Url: ")) \n
  > "+ " author " (" year "). " "\"/" title "/\" " publisher ". Visto el " date-seen " <" url  ">." \n
)


(define-skeleton davidam-skeleton-create
  "Insert a skeleton statement."
  ""
  '(setq str (skeleton-read "Function Name? "))
  > "(define-skeleton " str \n
  > "\"Insert a " str " statement.\"" \n
  > "\"\"" \n
  > _ \n
  > "> \"" str "();\" \\n" \n
  > -2 ")"
)

(define-skeleton davidam-skeleton-create-drupal
  "Insert a skeleton statement."
  ""
  '(setq str (skeleton-read "Function Name? "))
  > "(define-skeleton drupal-" str \n
  > "\"Insert a " str " statement.\"" \n
  > "\"\"" \n
  > _ \n
  > "> \"" str "();\" \\n" \n
  > -2 ")"
)

(define-skeleton davidam-skeleton-create-drupal-hook
  "Insert a skeleton statement."
  ""
  '(setq str (skeleton-read "Hook function? "))
  > "(define-skeleton drupal-" str \n
  > "\"Insert a " str " statement.\"" \n
  > "\"\"" \n
  > "'(setq module (skeleton-read \"module: \"))" \n
  _ \n
  > "> \"/**\" \\n" \n
  > "> -2 \"* Implements "str"().\"  \\n" \n
  > "> \"*/\" \\n" \n
  > "> \"function " str "() {\" \\n" \n
  > "_ \\n" \n
  > "> -2 \"}\"\\n" \n
  > ")"
)


(define-skeleton davidam-skeleton-create-php
  "Insert a skeleton statement."
  ""
  '(setq str (skeleton-read "Function Name? "))
  > "(define-skeleton php-" str \n
  > "\"Insert a " str " statement.\"" \n
  > "\"\"" \n
  > _ \n
  > "> \"" str "();\" \\n" \n
  > -2 ")"
)

(define-skeleton davidam-skeleton-add-setq
  "Add setq when I'm adding skeletons"
  ""
  '(setq var (skeleton-read "var: "))
  > "'(setq " var " (skeleton-read \"" var ": \"))"
)

(define-skeleton davidam-skeleton-ruby-case
  "Insert a skeleton statement."
  ""
  '(setq str (skeleton-read "Variable Name? "))
  > "case " str \n
  ( "condition, %s: "
  > "when " str \n
  > _ \n)
  > "else" \n
  > _ \n
  > "end" \n
  )

(define-skeleton davidam-skeleton-ruby-test
  "Insert a skeleton statement."
  ""
  '(setq class (skeleton-read "Class Name? "))
  > "RSpec.describe \"" class "\" do\n"
  ( "Test Name: %s "
  > "it \"" str "\" do \n"
  > "end" \n
  )
  > "end" \n
  )
  


(define-skeleton davidam-skeleton-add-copyright
  "Add copyright note"
  ""
  > ";; Copyright (C) " (format-time-string "%Y") "  David Arroyo Menéndez" \n
  > "" \n
  > ";; Author: David Arroyo Menéndez <" user-mail-address ">" \n
  > ";; Maintainer: David Arroyo Menéndez <" user-mail-address ">" \n
  > "" \n
  > ";; This file is free software; you can redistribute it and/or modify" \n
  > ";; it under the terms of the GNU General Public License as published by" \n
  > ";; the Free Software Foundation; either version 3, or (at your option)" \n
  > ";; any later version." \n
  > "" \n
  > ";; This file is distributed in the hope that it will be useful," \n
  > ";; but WITHOUT ANY WARRANTY; without even the implied warranty of" \n
  > ";; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the" \n
  > ";; GNU General Public License for more details." \n
  > "" \n
  > ";; You should have received a copy of the GNU General Public License" \n
  > ";; along with GNU Emacs; see the file COPYING.  If not, write to" \n
  > ";; the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor, " \n
  > ";; Boston, MA 02110-1301 USA," \n
) 

(define-skeleton davidam-skeleton-python-bin-and-utf8
  "Insert a skeleton statement."
  ""
  > "#!/usr/bin/python" \n
  > "# -*- coding: utf-8 -*-" \n  
)

(define-skeleton davidam-skeleton-shell-bin
  "Insert a skeleton statement."
  ""
  > "#!/bin/bash" \n
)

(define-skeleton davidam-skeleton-shell-copyright
  "Insert a skeleton statement."
  ""
  > "# Copyright (C) " (format-time-string "%Y") "  David Arroyo Menéndez" \n
  > "" \n
  > "# Author: David Arroyo Menéndez <" user-mail-address ">" \n
  > "# Maintainer: David Arroyo Menéndez <" user-mail-address ">" \n
  > "" \n
  > "# This file is free software; you can redistribute it and/or modify" \n
  > "# it under the terms of the GNU General Public License as published by" \n
  > "# the Free Software Foundation; either version 3, or (at your option)" \n
  > "# any later version." \n
  > "" \n
  > "# This file is distributed in the hope that it will be useful," \n
  > "# but WITHOUT ANY WARRANTY; without even the implied warranty of" \n
  > "# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the" \n
  > "# GNU General Public License for more details." \n
  > "" \n
  > "# You should have received a copy of the GNU General Public License" \n
  > "# along with GNU Emacs; see the file COPYING.  If not, write to" \n
  > "# the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor, " \n
  > "# Boston, MA 02110-1301 USA," \n
)




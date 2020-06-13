;; Copyright (C) 2018  David Arroyo Menéndez

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

(define-skeleton davidam-skeleton-damegender-test
  "Insert a test statement."
  ""
  '(setq name (skeleton-read "Test name? "))
  > "if ! cmp files/tests/" name ".txt files/tests/" name "-$(date \"+%Y-%m-%d-%H\").txt >/dev/null 2>&1 \n"
  > "then \n"
  > "    echo \"" name " test is failing\"" \n
  > "else" \n
  > "    echo \"" name " test is ok\"" \n
  > "fi" \n
  )


(define-skeleton davidam-skeleton-add-copyright
  "Add copyright note"
  ""
  '(setq program (skeleton-read "Software name? "))
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
  > ";; along with " program "; see the file LICENSE.  If not, write to" \n
  > ";; the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor, " \n
  > ";; Boston, MA 02110-1301 USA," \n
)

(define-skeleton davidam-skeleton-org-header
  "Add org header"
  ""
  '(setq title (skeleton-read "Title: "))
  '(setq author (skeleton-read "Author: "))
  '(setq lang (skeleton-read "Language: "))
  > "#+TITLE: " title "" \n
  > "#+AUTHOR: " author "" \n
  > "#+EMAIL: " user-mail-address "" \n
  > "#+DATE: [" (format-time-string "%Y-%m-%d") "]" \n
  > "#+LANGUAGE: " lang "" \n
  > "#+HTML_HEAD: <link rel='stylesheet' type='text/css' href='../css/org.css' />" \n
  )

(define-skeleton davidam-skeleton-org-beamer-header
  "Add org beamer header"
  ""
  '(setq title (skeleton-read "Title: "))
  '(setq author (skeleton-read "Author: "))
  '(setq lang (skeleton-read "Language: "))
  '(setq description (skeleton-read "Description: "))
  '(setq keywords (skeleton-read "Keywords : "))
  > "#+TITLE: " title "" \n
  > "#+AUTHOR: " author "" \n
  > "#+EMAIL: " user-mail-address "" \n
  > "#+DATE: [" (format-time-string "%Y-%m-%d") "]" \n
  > "#+LANGUAGE: " lang "" \n
  > "#+KEYWORDS: " keywords "" \n
  > "#+LaTeX_CLASS: beamer" \n
  > "#+LaTeX_CLASS_OPTIONS: [presentation]" \n
  > "#+BEAMER_THEME: Madrid" \n
  > "#+COLUMNS: %45ITEM %10BEAMER_ENV(Env) %10BEAMER_ACT(Act) %4BEAMER_COL(Col) %8BEAMER_OPT(Opt)" \n
  )



(define-skeleton davidam-skeleton-python-bin-and-utf8
  "Insert a skeleton statement."
  ""
  > "#!/usr/bin/python" \n
  > "# -*- coding: utf-8 -*-" \n
)

(define-skeleton davidam-skeleton-python-class
  "Insert a skeleton statement."
  ""
  '(setq class (skeleton-read "Class Name? "))
  > "class " class "(object):\n"
)


(define-skeleton davidam-skeleton-shell-bin
  "Insert a skeleton statement."
  ""
  > "#!/bin/bash" \n
)

(define-skeleton davidam-skeleton-shell-copyright
  "Insert a skeleton statement."
  ""
  '(setq program (skeleton-read "Software name? "))
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
  > "# along with " program "; see the file LICENSE.  If not, write to" \n
  > "# the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor, " \n
  > "# Boston, MA 02110-1301 USA," \n
)

(define-skeleton davidam-skeleton-c-copyright
  "Insert a skeleton statement."
  ""
  '(setq program (skeleton-read "Software name? "))
  > "/* Copyright (C) " (format-time-string "%Y") "  David Arroyo Menéndez" \n
  > ""
  > " Author: David Arroyo Menéndez <" user-mail-address ">" \n
  > " Maintainer: David Arroyo Menéndez <" user-mail-address ">" \n
  > ""
  > " This file is free software; you can redistribute it and/or modify"
  > " it under the terms of the GNU General Public License as published by"
  > " the Free Software Foundation; either version 3, or (at your option)"
  > " any later version."
  > ""
  > " This file is distributed in the hope that it will be useful,"
  > " but WITHOUT ANY WARRANTY; without even the implied warranty of"
  > " MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the"
  > " GNU General Public License for more details."
  > ""
  > " You should have received a copy of the GNU General Public License"
  > " along with " program "; see the file LICENSE.  If not, write to"
  > " the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor, "
  > " Boston, MA 02110-1301 USA, */"
)

(define-skeleton davidam-skeleton-wcl-c-copyright
  "Insert a skeleton statement."
  ""
  '(setq program (skeleton-read "Software name? "))
  > "/* Copyright (C) " (format-time-string "%Y") "  David Arroyo Menéndez" \n
  > ""
  > " Author: David Arroyo Menéndez <" user-mail-address ">" \n
  > " Maintainer: David Arroyo Menéndez <" user-mail-address ">" \n
  > ""
  > " This file is software with freedom of class; you can" \n
  > " redistribute it and/or modify it  only for the working" \n
  > " class under the terms of the Working Class License" \n
  > " published by David Arroyo Menéndez." \n
  > ""
  > " This file is distributed in the hope that it will be useful," \n
  > " but WITHOUT ANY WARRANTY; without even the implied warranty of" \n
  > " MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the" \n
  > " Working Class License for more details." \n
  > ""  
  > " You should have received a copy of the Working Class License along" \n
  > " with " program "; see the file COPYING. If not, see" \n
  > " <https://github.com/davidam/workingclasslicense>." \n
  > "*/"    
  )

(define-skeleton davidam-skeleton-wcl-copyright
  "Add copyright note"
  ""
  '(setq program (skeleton-read "Software name? "))
  > ";; Copyright (C) " (format-time-string "%Y") "  David Arroyo Menéndez" \n
  > "" \n
  > ";; Author: David Arroyo Menéndez <" user-mail-address ">" \n
  > ";; Maintainer: David Arroyo Menéndez <" user-mail-address ">" \n
  > "" \n
  > " This file is software with freedom of class; you can" \n
  > " redistribute it and/or modify it  only for the working" \n
  > " class under the terms of the Working Class License" \n
  > " published by David Arroyo Menéndez." \n
  > "" \n
  > " This file is distributed in the hope that it will be useful," \n
  > " but WITHOUT ANY WARRANTY; without even the implied warranty of" \n
  > " MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the" \n
  > " Working Class License for more details." \n
  > "" \n
  > " You should have received a copy of the Working Class License along" \n
  > " with " program "; see the file COPYING. If not, see" \n
  > " <https://github.com/davidam/workingclasslicense>." \n
  > "*/" \n   
)

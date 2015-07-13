;;; generate.cl --- Declt reference manual generation script

;; Copyright (C) 2010-2013, 2015 Didier Verna

;; Author: Didier Verna <didier@didierverna.net>

;; This file is part of Declt.

;; Permission to use, copy, modify, and distribute this software for any
;; purpose with or without fee is hereby granted, provided that the above
;; copyright notice and this permission notice appear in all copies.

;; THIS SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
;; WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
;; MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
;; ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
;; WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
;; ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
;; OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.


;;; Commentary:



;;; Code:

(require "asdf")

(defconstant +introduction+
  "@macro declt
@t{Declt}
@end macro

@macro cl
Common-Lisp
@end macro

@macro etc
@i{etc.}
@end macro

@declt{} (pronounce ``dec'let'') is a reference manual generator for
@cl{} libraries.  It works by loading an ASDF system and introspecting
its contents. The generated documentation contains the description of
the system itself and its local dependencies (other systems in the same
distribution): components (modules and files), packages and definitions
found in those packages.

Exported and internal definitions are listed separately. This allows the
reader to have a quick view on the library's public API. Within each
section, definitions are sorted lexicographically.

In addition to ASDF system components and packages, @declt{} documents
the following definitions: constants, special variables, symbol macros,
macros, @t{setf} expanders, compiler macros, functions (including
@t{setf} ones), generic functions and methods (including @t{setf} ones),
method combinations, conditions, structures, classes and types.

The generated documentation includes every possible bit of information
that introspecting can provide: documentation strings, lambda lists
(including qualifiers and specializers where appropriate), slots
(including type, allocation and initialization arguments), definition
source file @etc{}

Every documented item provides a full set of cross-references to related
items: ASDF component dependencies, parents and children, classes direct
methods, super and subclasses, slot readers and writers, @t{setf}
expanders access and update functions @etc{}

Finally, @declt{} produces exhaustive and multiple-entry indexes for
every documented item.

Reference manuals are generated in Texinfo format (compatible, but not
requiring Texinfo 5). From there it is possible to produce readable /
printable output in info, HTML, PDF, DVI and PostScript with tools such as
@command{makeinfo}, @command{texi2dvi} or @command{texi2pdf}.

The @declt{} Reference Manual, which you are currently reading,
is the primary example of documentation generated by @declt{} itself.
@ifinfo
See @xref{Top, , The Declt User Manual, declt-user},
@end ifinfo
@ifhtml
See @xref{Top, , The Declt User Manual, user},
@end ifhtml
@ifnotinfo
@ifnothtml
@xref{Top, , , user, The Declt User Manual},
@end ifnothtml
@end ifnotinfo
for a more human-readable guide to using @declt{}."
  "The reference manual's introductory text.")

(asdf:load-system :net.didierverna.declt)
(net.didierverna.declt:nickname-package)

;; ASDF doesn't understand my version numnbering scheme. That will change
;; soon, but in the meantime, I have to provide my version number explicitly
;; here.
(if (and (second sb-ext:*posix-argv*)
	 (string= (second sb-ext:*posix-argv*) "--web"))
    (declt:declt :net.didierverna.declt
		 :library-name "Declt"
		 :texi-file "webreference.texi"
		 :info-file "declt-webreference" ; but we don't care
		 :introduction +introduction+
		 :version (declt:version :long)
		 :license :bsd
		 :copyright-date "2010--2013, 2015")
    (declt:declt :net.didierverna.declt
		 :library-name "Declt"
		 :texi-file "reference.texi"
		 :info-file "declt-reference"
		 :introduction +introduction+
		 :version (declt:version :long)
		 :license :bsd
		 :copyright-date "2010--2013, 2015"
		 :hyperlinks t))

(uiop:quit)

;;; generate.cl ends here

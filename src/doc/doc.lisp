;;; doc.lisp --- Items documentation

;; Copyright (C) 2010 Didier Verna

;; Author:        Didier Verna <didier@lrde.epita.fr>
;; Maintainer:    Didier Verna <didier@lrde.epita.fr>
;; Created:       Thu Sep  9 12:31:11 2010
;; Last Revision: Thu Sep  9 15:25:16 2010

;; This file is part of Declt.

;; Declt is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License version 3,
;; as published by the Free Software Foundation

;; Declt is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.


;;; Commentary:

;; Contents management by FCM version 0.1.


;;; Code:

(in-package :com.dvlsoft.declt)

(defgeneric title (item &optional relative-to)
  (:documentation "Return ITEM's title."))

(defgeneric anchor (item &optional relative-to)
  (:documentation "Return ITEM's anchor name."))

(defgeneric index (item &optional relative-to)
  (:documentation "Render ITEM's indexing command."))

(defgeneric reference (item &optional relative-to)
  (:documentation "Render ITEM's reference.")
  (:method :before (item &optional relative-to)
    (index item relative-to)))


;;; doc.lisp ends here
;;;; This file was automatically generated by Quickutil.
;;;; See http://quickutil.org for details.

;;;; To regenerate:
;;;; (qtlc:save-utils-as #P"/home/didier/src/common-lisp/declt/quickutil.lisp" :WHEN-LET)

(eval-when (:compile-toplevel :load-toplevel :execute)
  (unless (find-package '#:quickutil)
    (defpackage quickutil
      (:documentation "Package that contains the actual utility functions.")
      (:nicknames #:qtl)
      (:use #:cl))))

(in-package #:quickutil)

  (defmacro when-let (bindings &body forms)
    "Creates new variable bindings, and conditionally executes FORMS.

BINDINGS must be either single binding of the form:

 (variable initial-form)

or a list of bindings of the form:

 ((variable-1 initial-form-1)
  (variable-2 initial-form-2)
  ...
  (variable-n initial-form-n))

All initial-forms are executed sequentially in the specified order. Then all
the variables are bound to the corresponding values.

If all variables were bound to true values, then FORMS are executed as an
implicit PROGN."
    (let* ((binding-list (if (and (consp bindings) (symbolp (car bindings)))
                             (list bindings)
                             bindings))
           (variables (mapcar #'car binding-list)))
      `(let ,binding-list
         (when (and ,@variables)
           ,@forms))))

  (defmacro when-let* (bindings &body forms)
    "Creates new variable bindings, and conditionally executes FORMS.

BINDINGS must be either single binding of the form:

 (variable initial-form)

or a list of bindings of the form:

 ((variable-1 initial-form-1)
  (variable-2 initial-form-2)
  ...
  (variable-n initial-form-n))

Each initial-form is executed in turn, and the variable bound to the
corresponding value. Initial-form expressions can refer to variables
previously bound by the WHEN-LET*.

Execution of WHEN-LET* stops immediately if any initial-form evaluates to NIL.
If all initial-forms evaluate to true, then FORMS are executed as an implicit
PROGN."
    (let ((binding-list (if (and (consp bindings) (symbolp (car bindings)))
                            (list bindings)
                            bindings)))
      (labels ((bind (bindings forms)
                 (if bindings
                     `((let (,(car bindings))
                         (when ,(caar bindings)
                           ,@(bind (cdr bindings) forms))))
                     forms)))
        `(let (,(car binding-list))
           (when ,(caar binding-list)
             ,@(bind (cdr binding-list) forms))))))
  
(export '(when-let when-let*))

;;;; END OF /home/didier/src/common-lisp/declt/quickutil.lisp ;;;;
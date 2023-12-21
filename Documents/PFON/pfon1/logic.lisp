(defun andOP (a b)
    (if (eq a b)
      (if (eq a t) t nil)
      nil
    )
)

(defun orOP (a b)
    (if (eq a b)
      (if (eq a nil) nil t)
    t)
)

(defun imply (a b)
  (orOP(not(a) b))
)

(defun equiv (a b)
  (andOP
    (imply a b)
    (imply b a)
  )
)

(defun xor (a b)
  (andOP
    (orOP a b)
    (not(andOP a b))
  )
)

(princ (andOP t t))
(terpri)
(princ (andOP t nil))
(terpri)
(princ (andOP nil nil))
(terpri)
(terpri)

(princ (orOP t t))
(terpri)
(princ (orOP t nil))
(terpri)
(princ (orOP nil nil))
(terpri)
(terpri)


(princ (xor t t))
(terpri)
(princ (xor t nil))
(terpri)
(princ (xor nil t))
(terpri)
(princ (xor nil nil))
(terpri)
(terpri)

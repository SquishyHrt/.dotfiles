(defun sumDigits (n)
  (if (< n 10) n
    (+ (sumDigits(floor n 10)) (rem n 10))
))

(defun div3 (n)
  (if (eq (rem (sum_dig n) 3) 0) t nil)
)

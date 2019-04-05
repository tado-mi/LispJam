
; absolute value
(defun abs (n)
  (if (< n 0) (- 0 n) n)
)

; factorial
(defun fact (n)
  (if (< n 3)
    ; base case
    n
    ; recursive case
    (* n (fact (- n 1)))
  )
)

; squaring function
(defun sq (x) (* x x))

; right tri
(defun right-tri (a b c)
  (eq (sq c) (+ (sq a) (sq b)))
)

; gcd
(defun gcd (a b)
  (if (> a b)
    (if (< (mod a b) 2)
      ; return b
      b
      ; recurse
      (gcd b (mod a b))
    )
    ; damage control
    (gcd b a)
  )
)

; lcm
(defun lcmh (a b ans)
  (if (and (eq 0 (mod ans a)) (eq 0 (mod ans b)))
    ; ans divides both a and b
    ans
    ; ans does not divide at least one of a or b
    (lcmh a b (+ ans 1))
  )
)

(defun lcm (a b)
  (if (> a b)
    ; a > b
    (lcmh a b a)
    ; b > a
    (lcmh b a b)
  )
)

; nth fibonacci
(defun nth-fibo (n)
  (if (< n 2)
    ; base case
    n
    ; recursive case
    (+ (nth-fibo(- n 1) ) (nth-fibo (- n 2)))
  )
)

; utility function for prime
; returns whether f is a factor of n
(defun is_factor (n f)
  (eq 0 (mod n f))
)

; whether n has a factor <= x
(defun has_factor (n x)
  (if (eq x 1)
    ; base case
    t
    ; recursive
    (if (is_factor n x)
      ; found a factor
      nil
      ; recurse
      (has_factor n (- x 1))
    )
  )

)

; prime
(defun primep (n)
  (if (< n 4)
    ; base case
    t
    ; call a helper
    (has_factor n (- n 1))
  )
)

; nth prime
(defun nth-primeh (n count p)
  (if (primep p)
    ; p is prime
    (if (eq n count)
      ; found nth prime
      p
      ; recurse and inc count
      (nth-primeh n (+ count 1) (+ p 1))
    )
    ; p is not prime
    (nth-primeh n count (+ p 1))
  )
)

(defun nth-prime (n)
  (nth-primeh n 1 2)
)

; math
(defun math ()
  (print "1. abs: -10")
  ((print (abs -10)))
  (print "2. factorial: 5")
  (print (fact 5))
  (print "3. right-tri: 6 8 10")
  (print (right-tri 6 8 10))
  (print "4. gcd: 8 12")
  (print (gcd 8 12))
  (print "5. lcm: 4 6")
  (print (lcm 4 6))
  (print "6. nth-fibo: 10")
  (print (nth-fibo 10))
  (print "7. prime: 11")
  (print (primep 11))
  (print "8. nth-prime: 26")
  (print (nth-prime 26))
  (print "")
)

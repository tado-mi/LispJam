; 0 if e is not a member of l, and 1 if e is member of l
(defun memb (e s)
  (if (eq s '())
    ; empty set
    nil
    ; non-empty set
    (if (eq e (first s))
      ; element found
      t
      ; keep searching
      (memb e (rest s))
    )
  )
)

; inserting an elelemnt to a list
(defun insert (e s)
  (if (memb e s) s (cons e s))
)

; set intersection
(defun intersh (s1 s2 ans)
  (if (eq s1 '())
    ; s1 is empty
    ans
    ; both lists are non empty
    (if (memb (first s1) s2)
      ; add first s1 to ans
      (intersh (rest s1) s2 (app ans (list (first s1))))
      ; do not add first s1 to ans
      (intersh (rest s1) s2 ans)
    )
  )
)

(defun inters (s1 s2)
  (intersh s1 s2 '())
)

; set union
(defun un (s1 s2)
  (nub (app s1 s2))
)

; set difference
(defun diffh (s1 s2 a)
  (if (eq s1 '())
    ; base case
    a
    ; recurse
    (if (memb (first s1) s2)
      ; omit (first s1)
      (diffh (rest s1) s2 a)
      ; include it
      (diffh (rest s1) s2 (app (list (first s1)) a))
    )
  )
)

(defun diff (s1 s2)
  (diffh s1 s2 '())
)

; symmetric set difference
(defun symm-diff (s1 s2)
  (diff (un s1 s2) (inters s1 s2))
)

; subset
(defun subsetp (sub sup)
  (if (eq sub '())
    ; base case
    t
    ; recurse or return false
    (if (memb (first sub) sup)
      ; recurse
      (subsetp (rest sub) sup)
      ; return false
      nil
    )
  )
)

; superset
(defun supersetp (sup sub)
  (subsetp sub sup)
)

; cardinality
(defun cardinalityh (s c)
  (if (eq s '())
    ; base case
    c
    ; recurse
    (cardinalityh (rest s) (+ c 1))
  )
)

(defun cardinality (s)
  (cardinalityh s 0)
)

; power set
(defun powerset(l)
  (if (eq l '())
    ; base case: power set of an empty set
    '(())
    ; recurse and append
    (let ((ps (powerset (cdr l))))
      (app ps (mapp #'(lambda (x) (cons (car l) x)) ps))
    )
  )
)

; set_functions
(defun set()
  (print "1. member: 2 '(3 2 4)")
  (print (memb 2 '(3 2 4)))
  (print "2. insert: a '(3 2 4)")
  (print (insert 'a '(3 2 4)))
  (print "3. itersection: '(1 2 4 5) '(3 2 4)")
  (print (inters '(1 2 4 5) '(3 2 4)))
  (print "4. union: '(1 2 4 5) '(3 2 4)")
  (print (un '(1 2 4 5) '(3 2 4)))
  (print "5. diff: '(a b c) '(a b d)")
  (print (diff '(a b c) '(a b d)))
  (print "6. symmetric diff: '(a b c) '(a b d)")
  (print (symm-diff '(a b c) '(a b d)))
  (print "7. subset: ’(a b) ’(a b c d)")
  (print (subsetp '(a b) '(a b c d)))
  (print "8. superset: ’(a b c d) ’(a b)")
  (print (supersetp '(a b c d) '(a b)))
  (print "9. cardinality: ’(a b c d)")
  (print (cardinality '(a b c d)))
  (print "10. power set: ’(a b c d)")
  (print (powerset '(a b c d)))
  (print "")
)

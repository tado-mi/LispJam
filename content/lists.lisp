; append
(defun app (l1 l2)
  (if (eq l1 nil)
    ; l1 is empty
    l2
    ; l1 is not empty
    (cons (first l1) (app (rest l1) l2))
  )
)

; reverse
(defun revh (r l)
  (if (eq l nil)
    ; l is empty
    '()
    ; l is not empty
    (app (rev (cdr l)) (list (first l)))
  )
)

(defun rev (l)
  (revh '() l)
)

; map
(defun add3 (x)
  (+ x 3)
)

(defun mapph (f x ans)
    (if (eq x nil)
     ; x is empty
     ans
     ; x is not empty
     (mapph f (rest x) (app ans (list (funcall f (first x)))))
    )
)

(defun mapp (f x)
  (mapph f x '())
)

; nub: remove duplicates
(defun nub (l)
  (if (eq l '())
    ; base case
    l
    ; recurse
    (if (memb (first l) (rest l))
     ; ignore the first element of l
     (nub (rest l))
     ; do not ignore the first element of legal
     (cons (first l) (nub (rest l)))
    )
  )
)

; fold
(defun fold (v f l)
  (if (eq l '())
    ; l is empty
    v
    ; l is not empty
    (fold (funcall f v (first l)) f (rest l))
  )

)

; filter
(defun lessthan3 (x)
  (< x 3)
)

(defun filterh (f l a)
  (if (eq l '())
    ; base case
    a
    ; recurse
    (if (funcall f (first l))
      ; first element belongs to the answer
      (filterh f (rest l) (app a (list (first l))))
      ; first elements doesn't belong to the answer
      (filterh f (rest l) a)
    )
  )
)

(defun filter (f l)
  (filterh f l '())
)

; merge
(defun mergeh (l1 l2 a)
  (if (or (eq l1 '()) (eq l2 '()))
    ; base case
    (app a (app l1 l2))
    ; recurse
    (if (< (first l1) (first l2))
      ; l1[0] < l2[0]
      (mergeh (rest l1) l2 (app a (list (first l1))))
      ; else
      (mergeh l1 (rest l2) (app a (list (first l2))))
    )
  )
)

(defun merge (l1 l2)
  (mergeh l1 l2 '())
)

; add to end
(defun addtoend (e l)
  (rev (app (list e) (rev l)))
)

; index of
(defun indexofh (e l i)
  (if (eq l '())
    ; element not found
    -1
    ; element may be found
    (if (eq e (first l))
      ; found the element
      i
      ; recurse
      (indexofh e (rest l) (+ i 1))
    )
  )
)

(defun indexof (e l)
  (indexofh e l 0)
)

; remove all
(defun remove-allh (e l a)
  (if (eq l '())
    ; base case
    a
    (if (eq e (first l))
      ; ommit first element
      (remove-allh e (rest l) a)
      ; add the first element
      (remove-allh e (rest l) (app a (list (first l))))
    )
  )
)

(defun remove-all (e l)
  (remove-allh e l '())
)

; list_functions
(defun list_ ()
  (print "1. append: '(a b c d) '(e f g 4 h)")
  (print (app '(a b c d) '(e f g 4 h)))
  (print "2. reverse: '(a b c d)")
  (print (rev '(a b c d)))
  (print "3. mapp: add3 '(1 0 -7 8)")
  (print (mapp #'add3 '(1 0 -7 8)))
  (print "4. remove duplicates: '(1 1 3 4 3 5)")
  (print (nub '(1 1 3 4 3 5)))
  (print "5. fold: 10 '- '(1 3 2)")
  (print (fold 10 '- '(1 3 2)))
  (print "6. filter: lessthan3 '(1 4 5 1 2 3 6)")
  (print (filter #'lessthan3 '(1 4 5 1 2 3 6)))
  (print "7. merge: '(1 3 7) '(2 4 5 6)")
  (print (merge '(1 3 7) '(2 4 5 6)))
  (print "8: add to end: 'd '(a b c)")
  (print (addtoend 'd '(a b c)))
  (print "9: index of: 'd '(a b c)")
  (print (indexof 'd '(a b c)))
  (print "10: remove all: 'a '(b a c a a d a)")
  (print (remove-all 'a '(b a c a a d a)))
  (print "")
)

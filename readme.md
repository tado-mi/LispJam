# Lisp Jam

an unmanageable pleasant jam of Lisp functions, written by [Lusine Keshishyan | tado-mi](https://github.com/tado-mi) in spring 2019, while working as a teaching assistant for initially for the [CSC 173](https://www.cs.rochester.edu/u/ferguson/csc/173/Spring2019/syllabus.html) course at the University of Rochester, in order to learn & practice Lisp, as well as get more familiar with functional programming paradigm. It is made public to demonstrate a code sample by the author, and for learning. We trust it will not be used to violate academic honesty policies.<br/>

Functions are as simple as their names. The restrictions for the project, however, were, to avoid using any imperative constructs, such as variables (`setq`), or for loops. The recommendation was to go on town with recursion.<br/>

The code has extensive comments for both your convenience and sanity, and mine.

There is no 'extra' interactivity with the user implemented (such as a (set of) REPL functions), as I found that to be an uninspiring syntactic challenge. In order to load functions for testing `(load main.lisp)`. If you need a lisp compiler, **abcl** may be useful.<br/>

# Files

## Lists

- [x] append two lists
- [x] reverse a list
- [x] map a function over every element in a list (called `mapcar` in Lisp)
- [x] remove duplicates from a list
- [x] fold-left (arguments: initial value, function, list)
- [x] filte list with a boolean function
- [x] merge two sorted lists
- [x] add an element to the end of a list
- [x] index of an element in a list
- [x] remove all e from a list l

## Sets

- [x] set membership
- [x] insert element into set
- [x] intersection
- [x] union
- [x] set difference
- [x] symmetric difference (disjunctive union)
- [x] subset
- [x] superset
- [x] cardinality
- [x] powerset

## Mathematics

- [x] absolute value
- [x] factorial
- [x] gcd
- [x] lcm
- [x] nth fibonacci number
- [x] test if a number is prime
- [x] nth prime number
- [x] sum of factors

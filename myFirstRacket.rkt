#lang racket

#|
 Author: Stephen Aranda
 Date  : 2/23/23 ----------------Completed on 3/1/23
 File  : myFirstRacket.rkt
 Desc  : This is my programming project
 written in Racket.
 It consists of a series of functions that
 perform their own individual tasks.


|#


#| divisible-by-x? function: Take an integer and determine if
   it can evenly divided by x
 |#

 (define divisible-by-x? 
    (λ (x)
      ( if (zero? (modulo x 2))
        #t
        #f)))

#| Here's the function call with the example x that should evaluate to true|#
(divisible-by-x? 10)

#| Here's the function call with the example x that should evaluate to false  |#
(divisible-by-x? 11)

#|----------------------------------------------------------------------------|#

'("---------------------------------------------------------------------------")

#| function-9 function : Defines a function that takes a function as an argument.
  Then passes an int, which is x, to that function and adds 6 to it.
|#

#|Example function that will be passed into function-9|#
(define (add-nine-to-five)
  (+ 9 5))
#|Here's the actual function definition for function-9|#
(define (function-9 func)
  (func))

 #| Here's the function call as an example to show that this function works |#
(function-9 add-nine-to-five)

#|--------------------------------------------------------------------------|#
'("-------------------------------------------------------------------------")

#| my-map function: define a function that accepts another function as an argument.
    this function is suppose to mimic the behavior of map.
    addNum is a helper function that just performs addition to the arg sent to it.
|#

#|Example function to demonstrate the operation performed on elements in my-map
before returned value is put into a new list.|#
(define addNum
      (λ (x)
        (+ x x)))


#|Here's the actual definition of my-map|#
(define (my-map func lst)
  (if (empty? lst)
      empty
      (cons (func (first lst)) (my-map func (rest lst)))))


#| Here's the function call to my-map and a list argument|#
(my-map addNum '(2 3 4 5 5))

(my-map addNum '(5 3 5 6))

#|----------------------------------------------------------------------|#
'("---------------------------------------------------------------------")

#| pair-up function: define a function that takes two lists as arguments, then returns
   a single list of pairs.
|#

(define (pair-up frlst seclst)
    ( if (empty? frlst)
         empty
           ( if(empty? seclst)
               empty
               (cons (list (first frlst) (first seclst))
                     (pair-up (rest frlst) (rest seclst))))))
                
               
#| Here's the function call with two example lists as arguments.|#
(pair-up '(1 2 3) '("yes" "bananas" "hello"))

#|-----------------------------------------------------------------------------|#
'("----------------------------------------------------------------------------")

#|classify function: a function that accepts a boolean test that tests an atomic value
      and/or a list of elements as arguments.
|#


#|Helper function that creates a list for the truth values within the list provided.
  Truth is determined by testing with the parameter test argument sent to the function
|#
(define (truth-list test lst)
  (if (empty? lst)
      empty
      (if (test (first lst))
          (append (list (first lst)) (truth-list test (rest lst)))
          (truth-list test (rest lst)))))

#|Helper function that creates a list for the false values withing the list provided.
  Falseness is determenined by testing with the parameter test argument sent to the function.
|#
(define (false-list test lst)
  (if (empty? lst)
      empty
      (if (test (first lst))
          (false-list test (rest lst))
          (append (list (first lst)) (false-list test (rest lst))))))


#|Here's the actual classify function. Accepts a parameter test and an argument.
 Returns a list containing two lists. The first list is a list of truth values, the
 other list contains the false values.
 |#
(define (classify test lst)
  
  (if (empty? lst)
      (list '() '())
      (list
        (append (truth-list test lst))
        (append (false-list test lst))
       )))

#|Here's the function call to classify to show how it works|#
(classify positive? '(1 -2 3 -5 6))

(classify string? '("hello" 4 5 "ye" 7.9))

#|------------------------------------------------------------------------------|#
'("----------------------------------------------------------------------------")


#|is-member?: A function that takes two arguments, a list and an expression, which may be atomic or a list.
Will return true if the element is a member of the list and false if it does not.
parameter atomicOrLst is the expression and lst is the list that we're
looking into and check if atomicOrLst is an element of lst
|#

(define (is-member? atomicOrLst lst)
  (if (empty? atomicOrLst)
      #f
      (if (empty? lst)
          #f
          (if (equal? atomicOrLst (first lst))
              #t
              (is-member? atomicOrLst (rest lst))))))
     

#|Here's the function call that shows how this function works|#
(is-member? 5 '(1 3 4 "hello" 5))

(is-member? 6 '(1 2 3 "hi"))
(is-member? '() '( 1 2 3 4))
(is-member? '(1 2) '( (1 2) 3 4))

#|--------------------------------------------------------------|#
'("-------------------------------------------------------------")

#|my-sorted? function: takes two arguments, a comparison function and a list.
Will return a boolean indicating whether the list is sorted according to the comparison function.|#

(define (my-sorted? paramCompare lst)
  (if (empty? lst)
      #t
      (if (equal? (length lst) 1)
          #t
          (if (paramCompare (first lst) (second lst))
              (my-sorted? paramCompare (rest lst))
              #f))))

#|Here's the function call to demonstrate how this function works|#
(my-sorted? < '(1 2 3 4))
(my-sorted? > '(4 3 2 1))
(my-sorted? < '( 1 3 2 3))
(my-sorted? > '(1 2 3))

#|-----------------------------------------------------------------------------------------|#
'("-----------------------------------------------------------------------------------")

#|my-flatten: This duplicates the flatten function from Racket standard library
but without the use of official helper functions from the library|#

#|drill-to-bottom: This is a helper function I created.
 It's meant to drill to the bottom of a well and return the
values that are at the bottom.
"well" is a deeply nested sublist ex: (((3 4)))|#
(define (drill-to-bottom well)
  ( if(empty? well)
      empty
      (if (list? (first well))
          (drill-to-bottom (first well))
          (append (list (first well)) (drill-to-bottom (rest well))))))


#|Here's the definition for my-flatten. |#
(define (my-flatten lst)
  (if (empty? lst)
      empty
      (if (list? (first lst))
          (append (drill-to-bottom (first lst)) (my-flatten (rest lst)))
          (append (list (first lst)) (my-flatten (rest lst))))))        
      
    
#|Here's the function call that demonstrates how the function works|#
(my-flatten '(((1 2))3))
(my-flatten '(3 ((1 2))))
(my-flatten '(2 3 4 5))
(my-flatten '(2 (4) (4 5)))

#|---------------------------------------------------------------------|#
'("---------------------------------------------------------------------")

#|upper-threshold function: Takes two arguments, a list of numbers and a single number
that represents a threshold value. I should return a new list that has the same numbers as the input list,
but with all elements greater than the threshold number removed.|#

(define (upper-threshold lst atomic)
  (if (empty? lst)
      empty
      (if (< (first lst) atomic)
        (append (list (first lst)) (upper-threshold (rest lst) atomic))
        (append '() (upper-threshold (rest lst) atomic)))))


#|Here's the function calls to show how this function works.|#
(upper-threshold '(1 2 3 4 6) 5)
(upper-threshold '(3 1 4 5 6 4) 5)

#|-------------------------------------------------------------------|#
'("------------------------------------------------------------------")

#|my-list-ref function: This function takes two arguments,
a list and an atomic value. Should return an element at the integer
number which represents the index of the element being returned.
|#

(define (my-list-ref lst atomic)
  (if (empty? lst)
      empty
      (if (eq? atomic (length lst))
          "Error: Index out of bounds"
          (if (> atomic (length lst))
              "Error: Index out of bounds"
              (if (eq? atomic 0)
                  (first lst)
                  (my-list-ref (rest lst) (- atomic 1)))))))


#|Here's the function calls showing how this function works|#
      
(my-list-ref '(1 2 3) 0)
(my-list-ref '(1 2 3) 1)
(my-list-ref '(1 2 3) 2)
(my-list-ref '(1 2 3) 3)
(my-list-ref '(1 2 3) 4)


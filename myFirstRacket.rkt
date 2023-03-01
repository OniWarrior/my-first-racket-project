#lang racket

#|
 Author: Stephen Aranda
 Date  : 2/23/23
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




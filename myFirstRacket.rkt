#lang racket

#|
 Author: Stephen Aranda
 Date  : 2/23/23
 File  : sra180006.rkt
 Desc  : This is my programming project
 written in Racket.
 It consists of a series of functions that
 perform their own individual tasks.


|#


#| Divisible-by-x? function: Take an integer and determine if
   it can evenly divided by x
 |#

 (define divisible-by-x? 
    (λ (x)
      ( if (zero? (modulo x 2))
        #t
      "Not evenly divisible")))

#| Here's the function call with the example x that should evaluate to true|#
(divisible-by-x? 10)

#| Here's the function call with the example x that should evaluate to false  |#
(divisible-by-x? 11)


#| function-9 function : Defines a function that takes a function as an argument.
  Then passes an int, which is x, to that function and adds nine to it.
|#

(define add-nine-to-arg
  (λ (x)
    (+ x 9)))


 #| Here's the function call as an example to show that this function works |#
(add-nine-to-arg 6)
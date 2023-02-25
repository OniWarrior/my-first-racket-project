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
  Then passes an int, which is x, to that function and adds 6 to it.
|#

(define function-9
  (λ (x)
    (+ x 6)))


 #| Here's the function call as an example to show that this function works |#
(function-9 9)


# | my-map function: define a function that accepts another function as an argument.
    this function is suppose to mimic the behavior of map.
    addNum is a helper function that just performs addition to the arg sent to it.
|#
(define addNum
      (λ (x)
        (+ x x)))

(define (my-map lst)
  (if (empty? lst)
      empty
      (cons (addNum (first lst)) (my-map (rest lst)))))


#| Here's the function call to my-map and a list argument|#
(my-map '(2 3 4 5 5))


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






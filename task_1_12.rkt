#lang racket

(define (pascal n)
  (if (< n 1) #f
             (pascal-row n)))
(define (pascal-row n)
  (if (= n 1) (display 1)
              (display (pascal-row (- n 1)))
  ))

(pascal 2)
(pascal 1)
#lang racket
(define (cubert-iter guess x)
  (if (good-enough? guess x)
      guess
      (cubert-iter (improve guess x)
                 x)))

(define (good-enough? guess x)
  (< (abs (- (cube guess) x)) 1e-5))

(define (improve guess x)
   (if (= guess 0.0)
      1.0
      (/ (+ (/ x (square guess)) (* 2 guess)) 3)))
(define (square x)
  (* x x))
(define (cube x)
  (* x x x))

(cubert-iter -2.0 27)
(cubert-iter -0.0 27)
(cubert-iter 2.0 27)
(cubert-iter 90.0 1e6)


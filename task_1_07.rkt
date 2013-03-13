#lang racket
(require rackunit)
(define (sqrt-iter1 guess x)
  (if (good-enough1? guess x)
      guess
      (sqrt-iter1 (improve guess x)
                 x)))
(define (sqrt-iter2 guess x)
  (if (good-enough2? guess x)
      guess
      (sqrt-iter2 (improve guess x)
                 x)))

(define (good-enough1? guess x)
  (< (abs (- (square guess) x)) 1e-3))

(define (good-enough2? guess x)
  (< (abs (- (improve guess x) guess)) (* guess 1e-6)))

(define (improve guess x)
  (average guess (/ x guess)))
(define (square x)
  (* x x))
(define (average x y)
  (/ (+ x y) 2))
;(check-equal? (< (abs (- 1 2)) 1e-6)
(sqrt-iter1 900.0 1e6)
(sqrt-iter2 990.0 1e6)
(sqrt-iter1 1.0 2)
(sqrt-iter2 1.0 2)

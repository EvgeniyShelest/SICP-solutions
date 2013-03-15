#lang racket

(require rackunit)

(define eps 1e-6)
(define (square x)
  (* x x))
(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))
(define (good-enough? guess x)
  (< (abs (/ (- (improve guess x) guess) guess)) eps))

(define (cubert-iter guess x)
  (if (good-enough? guess x)
      (improve guess x)
      (cubert-iter (improve guess x)
                 x)))

(define (cubert x)
  (cond ((< (abs x) eps) 0.0)
        ((< x 0) (cubert-iter -1.0 x))
        (else (cubert-iter 1.0 x))))

(check-equal? (cubert -0.0) 0.0)
(check < (abs (- (cubert 27) 3.0)) eps)
(check < (abs (- (cubert -27) -3.0)) eps)
(check < (abs (- (cubert 1e6) 1e2)) eps)


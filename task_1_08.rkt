#lang racket

(require rackunit)

(define eps 1e-6)
(define (square x)
  (* x x))

(define (cubert-iter guess x)
  (define (improve)
    (/ (+ (/ x (square guess)) (* 2 guess)) 3))
  (define next-guess (improve))
  (define (good-enough?)
    (< (abs (/ (- next-guess guess) guess)) eps)) 
  
  (if (good-enough?)
      next-guess
      (cubert-iter next-guess
                   x)))

(define (cubert x)
  (cond ((< (abs x) eps) 0.0)
        ((< x 0) (cubert-iter -1.0 x))
        (else (cubert-iter 1.0 x))))

(check-equal? (cubert -0.0) 0.0)
(check < (abs (- (cubert 27) 3.0)) eps)
(check < (abs (- (cubert -27) -3.0)) eps)
(check < (abs (- (cubert 1e6) 1e2)) eps)


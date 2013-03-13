#lang racket

(require rackunit)

(define (square x)
  (* x x))

(define (sum-squares x y)
  (+ (square x) (square y)))

(define (sum-squares-two-biggest-num x y z)
  (cond ((and (<= x y) (<= x z))
         (sum-squares y z))
        ((and (<= y x) (<= y z))
         (sum-squares x z))
        ((and (<= z x) (<= z y))
         (sum-squares x y))))

(check-equal? (sum-squares-two-biggest-num 1 2 3) 13)
(check-equal? (sum-squares-two-biggest-num 2 1 3) 13)
(check-equal? (sum-squares-two-biggest-num 2 3 1) 13)
(check-equal? (sum-squares-two-biggest-num 2 2 3) 13)
(check-equal? (sum-squares-two-biggest-num 2 2 2) 8)
(check-equal? (sum-squares-two-biggest-num 1 2 1) 5)
(check-equal? (sum-squares-two-biggest-num 1 0 0) 1)
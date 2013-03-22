#lang racket
(require rackunit)

(define (pascal-num row index)
  (cond ((or (< row 1) (< index 1) (> index row)) #f)
        ((or (= row index) (= index 1)) 1)
        (else (+ (pascal-num (- row 1) (- index 1)) (pascal-num (- row 1) index)))))

(define (cycle-out row)
  (define (cycle-in index)
    (display (pascal-num row index))
    (display " ")
    (if (> index 1) (cycle-in (- index 1))
                    (display "")))
  (cycle-in row)
  (display "\n")
  (if (> row 1) (cycle-out (- row 1))
                (display "")))

(cycle-out 10)
(check-eqv? (pascal-num 4 5) #f)
(check-eqv? (pascal-num 4 -3) #f)
(check-eqv? (pascal-num 0 0) #f)

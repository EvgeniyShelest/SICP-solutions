#lang racket
(require rackunit)
;solution
(define (pascal-num row index)
  (cond ((or (< row 1) (< index 1) (> index row)) #f)
        ((or (= row index) (= index 1)) 1)
        (else (+ (pascal-num (- row 1) (- index 1)) (pascal-num (- row 1) index)))))

;demonstration
(define (pascal-triangle R)
  (define row R)
  (define (cycle-out row)
    (define (cycle-in index)
      (display (pascal-num row index))
      (display " ")
      (if (> index 1) (cycle-in (- index 1))
                      (display "\n")))
    (cycle-in row)
    (if (< row R) (cycle-out (+ row 1))
                  (display "")))
  (cycle-out 1))

(pascal-triangle 10)
;tests
(check-eqv? (pascal-num 4 5) #f)
(check-eqv? (pascal-num 4 -3) #f)
(check-eqv? (pascal-num 0 0) #f)

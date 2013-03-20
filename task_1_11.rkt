#lang racket
; A function f is defined by the rule that f(n) = n if n<3 and f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n>= 3. 
(require rackunit)

;рекурсивный процесс с тернарной древовидной рекурсией
;число шагов вычисления растет пропорционально росту самого числа
(define (f n)
  (cond ((< n 3) n)
        (else (+ (f (- n 1))
                 (* 2 (f (- n 2)))
                 (* 3 (f (- n 3)))
                 ))))
;итеративный процесс с рекурсивной линейной функцией
;число шагов вычисления растет пропорционально n
(define (fi n)
  (if (< n 3)
      n
      (fi-iter 0 1 2 n)))
(define (fi-iter a b c count)
  (if (= count 2)
      c
      (fi-iter b c (+ (* 3 a) (* 2 b) c) (- count 1))))

;(f 123) ; зависает
(fi 123) ; 5185162204639909618421859730102931228755683529 (меньше секунды)
(check-equal? (f 20) (fi 20))

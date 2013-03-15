#lang racket
;декларация условия задачи
;√x = такое y, что y ≥ 0 и y^2 = x
;комплексные решения не учитываем

(require rackunit)

(define eps 1e-6)
(define (square x)
  (* x x))
(define (average x y)
  (/ (+ x y) 2))
(define (improve guess x)
  (average guess (/ x guess)))

;реализация относительной погрешности для x бОльших чем 1/eps
;дает бОльшую погрешность чем при использовании абсолютной погрешности.
;Для них необходимо подбирать eps для обеспечения нужной точности.
;Для малых точность увеличилась на порядки.
(define (good-enough? guess x)
  (< (abs (- (improve guess x) guess)) (* guess eps)))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      (improve guess x)
      (sqrt-iter (improve guess x)
                 x)))

(define (sqrt-my x)
  (cond ((< x 0) #f)
        ((< x eps) 0.0)
        (else (sqrt-iter 1.0 x))))

(check-equal? (sqrt-my 9) 3.0)
(check-false (sqrt-my -1))
(check < (abs (- (sqrt-my 1e6) (sqrt 1e6))) eps)

(sqrt-my 9)
(sqrt-my 1e16)
(sqrt-my 1e-20)



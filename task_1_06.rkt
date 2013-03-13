#lang racket
;Конструкция new-if когда предикат становится #t все равно вычисляет второй аргумент.
;Видимо это связано с аппликативным порядком вычислений по умолчанию.
;Таким образом в такой реализации код зацикливается.
;Тогда как специальная инструкция if демонстрирует нормальный порядк вычислений
;и соответственно не пытается вычислить второй аргумент, когда он не нужен.
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))
(define (sqrt-new guess x)
  (new-if (good-enough? guess x)
      guess
      (sqrt-new (improve guess x)
                 x)))
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))
(define (improve guess x)
   (if (= guess 0.0)
      1.0
      (average guess (/ x guess))))
(define (square x)
  (* x x))
(define (average x y)
  (/ (+ x y) 2))
(sqrt-iter 1.0 9)
;(sqrt-new 1.4 2)
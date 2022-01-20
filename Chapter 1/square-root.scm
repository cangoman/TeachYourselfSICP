(define (sqrt-iter guess x) 
  (if (good-enough? (improve guess x) x)
        guess
        (sqrt-iter (improve guess x)
          x)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.00001))

(define (improve guess x) 
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (square x) (* x x))

; (sqrt 9)
; (sqrt 400)
; (sqrt (+ 100 37))

; (define (new-if predicate then-clause else-clause)
;   (cond (predicate then-clause)
;         (else else-clause)))

; ; This won't work. The function evaluates 
; (define (new-sqrt-iter guess x)
;   (new-if (good-enough? guess x)
;           guess
;           (new-sqrt-iter (improve guess x)
;                      x)))

; (define (new-sqrt x)
;   (new-sqrt-iter 1.0 x))



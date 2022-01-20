; need these from before
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


; actual exercises
(define (next-perf x) 
    (if (= (sum-of-factors x 1) x) 
        x
        (next-perf (+ x 1)))
)

(define (sum-of-factors x i) 
    (cond ((= i x) 0 )
          ((isDivisor? x i) (+ i (sum-of-factors x (+ i 1)))
          )
          (else (sum-of-factors x (+ i 1)))
    ))  

(define (isDivisor? x n)
    (if (= (modulo x n) 0)
    #t
    #f
    )
)

(next-perf 29)
; (sum-of-factors 6 1)
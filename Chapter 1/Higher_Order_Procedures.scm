(define (sum term a next b)
    (if (> a b)
        0
        (+ (term a)
           (sum term (next a) next b))))

(define (inc n) (+ n 1))
(define (identity n) n)

(define (sum-integers a b) 
    (sum identity a inc b))


; linear recursion
(define (sum-recursive term a next b)
    (if (> a b)
        0
        (+ (term a)
           (sum-recursive term (next a) next b))))

; iterative
(define (identity n) n)
(define (inc n) (+ n 1))
(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))
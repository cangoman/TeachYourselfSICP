(define (sum term a next b)
    (if (> a b)
        0
        (+ (term a)
           (sum term (next a) next b))))

(define (sum-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))

(define (inc n) (+ n 1)) ; still needed
(define (identity n) n)

(define (sum-integers a b) 
    (sum identity a inc b))


; do same for multiplication
(define (product term a next b)
    (if (> a b) 
    1
    (* (term a) 
       (product term (next a) next b))))

(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))

(define (factorial n) 
  (product identity 1 inc n)
  )

(define (factorial-iter n)
    (product-iter identity 1 inc n)
)

(define (wallis-product n)
  (define (term n)
    (* (/ (* 2 n)
          (- (* 2 n) 1))
       (/ (* 2 n)
          (+ (* 2 n) 1))))
  (product term 1.0 inc n))




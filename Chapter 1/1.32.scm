(define (sum term a next b)
    (if (> a b)
        0
        (+ (term a)
           (sum term (next a) next b))))

(define (product term a next b)
    (if (> a b) 
    1
    (* (term a) 
       (product term (next a) next b))))


(define (accumulate combiner null-value term a next b)
    (if (> a b)
        null_value
        (combiner (term a)
           (acuumulate term (next a) next b))))

(define (accum-sum a b)
    (accumulator + 0 (lambda (x) (x) a (lambda (x) (+ x 1))))
)

(accum-sum 1 10)
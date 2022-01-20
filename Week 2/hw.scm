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
        null-value
        (combiner (term a)
           (accumulate combiner null-value term (next a) next b))))

(define (accum-sum a b)
    (accumulate + 0 (lambda (x) x) a (lambda (x) (+ x 1)) b))

(define (accum-prod a b)
    (accumulate * 1 (lambda (x) x) a (lambda (x) (+ x 1)) b))


(accum-prod 4 10)

(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (filtered-accumulate combiner null-value term a next b filter)
    (if (> a b)
        null-value
        (combiner (if (filter a) (term a) null-value) 
        (filtered-accumulate combiner null-value term (next a) next b filter))
    )
)

(define (sum-squares-primes a b)
    (filtered-accumulate + 0 (lambda (x) (* x x)) a (lambda (x) (+ x 1)) b prime?)) 

(sum-squares-primes 1 10)

;1.40
(define tolerance 0.00001)

(define (average a b)
  (/ (+ a b) 2))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define dx 0.00001)

(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x)
            ((deriv g) x)))))

(define (newtons-method g guess)
  (fixed-point (newton-transform g)
               guess))

(define (cubic a b c) 
    (lambda (x) (+ (* x x x ) (* a x x) (* b x) c)))

(newtons-method (cubic 1 1 1) 1)

; 1.41

(define (inc x) (+ 1 x))
(define (square x) (* x x))
(define (apply-twice f)
    (lambda (x) (f (f x))))


((apply-twice inc) 1)
(((apply-twice (apply-twice apply-twice)) inc) 5)



; 1.42
(define (compose f g)
    (lambda (x) ( f (g x)))
)

((compose square inc) 6)

; 1.43
(define (repeated f n)
    (if (= n 1)
    f
    (compose f (repeated f (- n 1))))
)

((repeated square 3) 5)


; smoothing 1.44

(define (smooth f) 
    (lambda (x) (/ ((f (- x dx)) (f x) (f (+ x dx))) 3)))

(define (n-fold-smooth f n) 
    ((repeated smooth n) f)
)
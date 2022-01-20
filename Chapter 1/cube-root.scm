(define (cube x) (* x x x))

(define (good-enough? previous-guess guess)
  (< (abs (/ (- guess previous-guess) guess)) 0.0000001))

(define (cubert-iter guess x)
  (if (good-enough? (improve-cube guess x) guess)
    guess
    (cubert-iter (improve-cube guess x) x
    )))

(define (improve-cube guess x)
  (/ (+ (/ x (* guess guess)) (* 2 guess) ) 3))


(define (cubert x) 
  (cubert-iter 1.0 x))


(cubert 8)



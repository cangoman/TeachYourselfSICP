; Ackermann's function
(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))


; Concise Mathematical Definitions 

; (f n) computes 2n
(define (f n) (A 0 n))

; computes 2^n
(define (g n) (A 1 n))

; 2 computes 2^h(n-1)
(define (h n) (A 2 n))

; Computes 5n^2
(define (k n) (* 5 n n))
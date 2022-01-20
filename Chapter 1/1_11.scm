; f(n) = n if n <3
; f(n) = f(n -1) + 2*f(n-2) + 3*f(n-3) if n>=3


; Recursive process
(define (f-rec n) 
    (cond ((< n 3) n)
        (else (+ (f-rec (- n 1)) (* 2 (f-rec (- n 2))) (* 3 (f-rec (- n 3)))) )
        )
)

; Iterative process

(define (f-iterative n)
  (define (f-loop n-1 n-2 n-3 nth)
    (if (= n nth)
        n-1
        (f-loop (+ n-1 (* 2 n-2) (* 3 n-3)) n-1 n-2 (+ 1 nth))))
  (if (< n 3)
      n
      (f-loop 2 1 0 2)))
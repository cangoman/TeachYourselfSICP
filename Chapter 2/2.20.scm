(define (same-parity x . y) 
    (define (test-parity n) (= (modulo x 2) (modulo n 2)))
    (filter test-parity y))

; (define lst (list 1 2 3 4 5 6 7 8 9 10))


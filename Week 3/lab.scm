; safe procedures

(define (type-check fn check arg) 
    (if (check arg) (fn arg) #f)
)

(type-check sqrt number? 5)
(type-check sqrt number? `hello)

(define (make-safe fn check) 
    (lambda (x) (type-check fn check x))
)

(define safe-sqrt (make-safe sqrt number?)) 

(safe-sqrt `hello)
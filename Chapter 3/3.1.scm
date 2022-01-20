; accumulator...wil return a lambda function that modifies its state
(define (make-accumulator value)
    (lambda (valueToAdd)
        (begin (set! value (+ value valueToAdd))
            value
        )))

(define A (make-accumulator 5))
(A 10)
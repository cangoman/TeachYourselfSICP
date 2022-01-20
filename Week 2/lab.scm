((lambda (x) (+ x 3)) 7) ; evaluates de lambda fx

(define (make-adder num)
    (lambda (x) (+ x num)))

((make-adder 3) 7)

(define plus3 (make-adder 3))

(plus3 7)

(define (square x) (* x x))
(square 5)

(define sq (lambda (x) (* x x)))

(sq 5)

(define (try f) (f 3 5))

(try +)
(try word)


(define (substitute sent old new) 
    (cond ((empty? sent) '()) ; don't forget the base case!
        ((equal? (first sent) old) (se new (substitute (bf sent) old new)))
        (else (se (first sent) (substitute (bf sent) old new)))
    )
)

(substitute '(she loves you yeah yeah yeah) 'yeah 'maybe)

;
;((g) 1) ; g returns a function
; g takes no arguments
; the function returned by g takes one argument

;What must f be for each (to run w-o errors):

; f -> a variable. ex (define f 5)
; (f) -> a function that takes no arguments (define (f) 5)
; (f 3) -> a function that takes an argument (define (f x) (* x x))
; ((f)) -> a function (no arguments) that returns a function (that takes no arguments) (define (f) (lambda () (* 2 2) ))
; ( ((f)) 3 ) -> f is a function that returns a function that returns a function that takes an argument ; (define (f) (lambda () (lambda (x) (* x x)) ))

(define (inc x) (+ 1 x))
(define (t f) 
    (lambda (x) (f (f (f x)))))


(define (make-tester w)
    (lambda (x) ( if (equal? w x) #t #f))
)
(define (square x) (* x x))
(define (average x y) (/ (+ x y) 2))
(define (average-damp f)
  (lambda (x) (average x (f x))))


(define dx 0.0001)
(define (deriv g) 
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
    dx)))

(define (make-point x y) (cons x y))
(define (make-segment p1 p2) (cons p1 p2))

(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (seg-start seg) (car seg))
(define (seg-end seg) (cdr seg))


(define (print-point p)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (print-segment seg) 
    (newline)
    (display "[")
    (print-point (seg-start seg))
    (display ",")
    (print-point (seg-end seg))
    (display "]"))


(define (mid-point line) 
    (
    let ( (start (car line)) (end (cdr line) ))
    
    (make-point 
        (/ (+ (x-point start) (x-point end)) 2) 
        (/ (+ (y-point start) (y-point end)) 2)
    )
    )
)

(define four-five (make-point 4 5))
(define six-seven (make-point 6 7))
(print-segment (make-segment four-five six-seven))
(newline)
(print-point (mid-point (make-segment four-five six-seven)))
(define (square-list items)
  (if (null? items)
    '()
    (cons (* (car items) (car items)) (square-list (cdr items)))))

(define (square-list-map items)
  (map (lambda (x) (* x x)) items))


(define lst (list 1 2 3 4 5 6))
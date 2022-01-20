#|
(cons (square (car things))
    answer))))
Makes a list where the answer is being placed at the end of the list at every time

|#
(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things) 
              (cons (square (car things))
                    answer))))
  (iter items '()))

(define (square-list-2 items)
  (define (iter things answer)
    ( if (null? things)
        answer
        (iter (cdr things)
              (append answer
                    (list (square (car things)))))))
;   (display items)
  (iter items '()))


(define lst (list 1 2 3 4 5 6))
(square-list-2 lst)

(define (square x) (* x x))

( define lst (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))

(define (square-tree-dir tree) 
    (cond ((null? tree) '() )
          ((not (pair? tree)) (square tree))
          (else (cons (square-tree-dir (car tree)) 
                      (square-tree-dir (cdr tree))))
    ))


(define (square-tree tree) 
    (map (lambda (sub-tree)
        (if (pair? sub-tree)
            (square-tree sub-tree)
            (square sub-tree)))
            tree))
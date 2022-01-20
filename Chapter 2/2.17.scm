
(define myList (list 1 2 3 4 5))

(define (last-pair list1) 
    (if (null? (cdr list1))
        list1
        (last-pair (cdr list1))
        ))

(last-pair myList)
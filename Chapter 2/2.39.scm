(define (fold-right op initial sequence) 
   (if (null? sequence) 
       initial 
       (op (car sequence) 
           (fold-right op initial (cdr sequence))))) 

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))


 (define (reverse-using-right items) 
   (fold-right (lambda (first already-reversed) 
                 (append already-reversed (list first))) 
               '() 
               items)) 
  
 (define (reverse-using-left items) 
   (fold-left (lambda (result first) (cons first result)) 
              '() 
              items)) 


(define items (list 1 2 3 4 5)) 
(reverse-using-right items) 
(reverse-using-left items) 
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


(fold-right / 1 (list 1 2 3))
; 3/2

(fold-left / 1 (list 1 2 3))
; 1/6

(fold-right list '() (list 1 2 3))
; (1 (2 (3 ())))

(fold-left list '() (list 1 2 3))
; (((() 1) 2) 3)


; In order for them to be equal, op needs to be commutative and associative like:


(fold-right * 1 (list 1 2 3))
;6

(fold-left * 1 (list 1 2 3))
; also 6

(fold-right + 0 (list 1 2 3))
; 6


(fold-left + 0 (list 1 2 3))
; also 6
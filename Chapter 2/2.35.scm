; (define (count-leaves x)
;   (cond ((null? x) 0)  
;         ((not (pair? x)) 1)
;         (else (+ (count-leaves (car x))
;                  (count-leaves (cdr x))))))
 
 
 (define (accumulate op initial sequence) 
   (if (null? sequence) 
       initial 
       (op (car sequence) 
           (accumulate op initial (cdr sequence))))) 


(define (count-leaves t) 
    (accumulate + 0 (map (lambda (x) 
                            (if (pair? x) (count-leaves x) 1)) 
                            t)))

count-leaves


(define x (cons (list 1 2) (list 3 4)))

; (count-leaves x)

(count-leaves (list x x))

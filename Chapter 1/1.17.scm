;(define (* a b)
;  (if (= b 0)
;      0
;      (+ a (* a (- b 1)))))

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (* a b) 
    (cond ((or (= a 0) (= b 0)) 0))
          ((= a 1) b)
          ((= b 1) a)
)


(define (double a) (+ a a))
(define (halve a) (/ a 2))
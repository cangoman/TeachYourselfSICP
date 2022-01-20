; Pascal's triangle

; 1
; 1 1
; 1 2 1
; 1 3 3  1
; 1 4 6  4  1
; 1 5 10 10 5 1

(define (pascal row col) 
  (cond ((= row 1) 1) 
        ((or (= col 1) (= col row)) 1)
        (else (+ (pascal (- row 1) (- col 1)) (pascal (- row 1) col ))
        
  )))


; this I got from the site:

(define (display-pascal-row n)
  (define (column-iter i)
    (display (pascal n i)) (display "  ")
    (if (= i n)
        (newline)
        (column-iter (+ i 1))))
  (column-iter 1))

(define (display-pascal n)
  (define (display-pascal-iter i)
    (display-pascal-row i)
    (if (= i n)
        (newline)
        (display-pascal-iter (+ i 1))))
  (display-pascal-iter 1))
(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (lower-bound y))
                 (- (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval x 
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))


(define (div-interval-safe x y) 
    (if (or (and (< 0 (lower-bound x)) (> 0 (upper-bound x)))
            (and (> 0 (lower-bound x)) (< 0 (lower-bound x)))
            (and (< 0 (lower-bound y)) (> 0 (lower-bound y)))
            (and (> 0 (lower-bound y)) (< 0 (lower-bound y))))
            (error "One or more intervals crossing zero")
            (div-interval x y)
            )
)
(define (make-interval a b) (cons a b))


(define (lower-bound a) (car a))
(define (upper-bound a) (cdr a))

; If we are not guaranteed to have them in order
; (define (upper-bound a) 
;    (let ((x (car a)) (y (cdr a)))
;    (max x y)))

; (define (lower-bound a) 
;    (let ((x (car a)) (y (cdr a)))
;    (min x y)))

; This defines it as a procedure
; (define (myInt) (make-interval 1 10))
; This defines it as a variable
(define myInt (make-interval 1 10))


(define (make-center-percent value tol_percent)
    (let ((tolerance (percent_to_val value tol_percent)))
    (make-interval (- value tolerance) (+ value tolerance))
    )
)

(define (percent_to_val value percentage) 
    (* value (/ percentage 100.0))
)

(make-center-percent 60 10)

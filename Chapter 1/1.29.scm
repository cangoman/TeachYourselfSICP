(define (sum term a next b)
    (if (> a b)
        0
        (+ (term a)
           (sum term (next a) next b))))

(define (inc n) (+ n 1))
(define (identity n) n)

(define (sum-integers a b) 
    (sum identity a inc b))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))


(define (integral-simpson f a b n)
    ; utility functions
    (define h (/ (- b a) n)) ; h = (b - a)/ n
    (define (add-2h x) (+ x h h))

    (* (+ (f a)                          ; y_0
          (* 2 (sum f a       add-2h b)) ; even terms
          (* 4 (sum f (+ a h) add-2h b)) ; odd terms
          (f b)                          ; y_n            
        )
        (/ h 3)
        )
)

(define (cube x) (* x x x))
(newline)
(display (integral cube 0 1 0.01)) (newline)
(display (integral cube 0 1 0.001)) (newline)

(display (integral-simpson cube 0 1.0 100 )) (newline)
(display (integral-simpson cube 0 1.0 1000 )) (newline)
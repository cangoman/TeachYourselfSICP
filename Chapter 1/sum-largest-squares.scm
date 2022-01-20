(define (sum-squares a b) (+ (* a a) (* b b)))

(sum-squares 3 4)

(define (sum-larger-squares a b c) 
  ( cond ((and (< a b) (< a c)) (sum-squares b c))
         ((and (< b a) (< b c)) (sum-squares a c))
         (else (sum-squares a b))

  )
)

(display (sum-larger-squares 3 2 1))

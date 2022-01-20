(define (swap-word actual old new) 
    (if (equal? actual old)
        new
        actual
    ))

(define (sub-w-helper sent old new)
    (if (empty? sent)
        '()
        (se (swap-word (first sent) old new) (sub-w-helper (bf sent) old new) )
    )
)

; kinda working
(define (substitute sent old new) 
    (cond ((empty? sent) '())
        ((sentence? (first sent)) (list (substitute (first sent) old new) (substitute (bf sent) old new)))
        ((equal? (first sent) old) (list new (substitute (bf sent) old new)))
        (else (list (first sent) (substitute (bf sent) old new)))
    ))

; (define (substitute sent old new) 
;     (cond ((empty? sent) '())
;         ((sentence? (first sent)) (se ( list (substitute (first sent) old new)) (bf sent)))
;         ; (substitute (bf sent) old new)))
;         ((word? (first sent))(se (swap-word (first sent) old new) (substitute (bf sent) old new)))
;     ))

; (define (substitute sent old new) 

;     (if (sentence? (first sent) ) 
;         (se ( se (map (lambda (n) (swap-word n old new)) (first sent))) (se (substitute (bf sent) old new)))
    
;     (map (lambda (n) (swap-word n old new)) sent))
;      )

(define (substitute2 sent old new) 
    ( if (empty? old) 
        sent
        (se (substitute sent (first old) (first new)))   
    )
)

; (sub-w-helper '(lead axe bass axe rhythm axe drums) 'guitar 'axe )

(substitute '((lead guitar) (bass guitar) (rhythm guitar) drums) 'guitar 'axe ) 
; (substitute '(lead guitar drums) 'guitar 'axe ) 

; (substitute2 '((4 calling birds) (3 french hens) (2 turtle doves)) '(1 2 3 4) '(one two three four))
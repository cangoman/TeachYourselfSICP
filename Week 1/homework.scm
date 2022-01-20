; 2. Write procedure that takes a sentence, returns a sentence of the squares of the numbers

(define (square x)(* x x))
(define (squares a) 
    (cond ((empty? a) '())
        (else (se (square (maybe-num (first a))) (squares (bf a))))
))

; 3. Write a procedure `switch` that takes a sentence and returns a sentence where I, me is replaced by you

(define (switch sent)
  (se (switch-first (first sent))
      (switch-rest (bf sent)) ))

(define (switch-first wd)
  (cond ((equal? wd 'you) 'I)
	((equal? wd 'I) 'you)
	((equal? wd 'me) 'you)
	(else wd) ))

(define (switch-rest sent)
  (if (empty? sent)
      '()
      (se (switch-one (first sent))
	  (switch-rest (bf sent)) )))

(define (switch-one wd)
  (cond ((equal? wd 'you) 'me)
	((equal? wd 'I) 'you)
	((equal? wd 'me) 'you)
	(else wd) ))

; 4. ordered
(define (ordered? sent)
  (cond ((empty? (bf sent)) #t)
	((> (first sent) (first (bf sent))) #f)
	(else (ordered? (bf sent))) ))

; 5. ends-e. takes sentence, returns only words ending in e
(define (ends-e sent)
    (cond ( (empty? sent) '())
        ((equal? (last (first sent)) 'e ) (se (first sent) (ends-e (bf sent))))
        (else (ends-e (bf sent)))
    )
)
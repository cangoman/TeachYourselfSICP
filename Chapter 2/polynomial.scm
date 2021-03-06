(define (install-polynomial-package)
  ;; internal procedures
  ;; representation of poly
  (define (make-poly variable term-list)
    (cons variable term-list))
  (define (variable p) (car p))
  (define (term-list p) (cdr p))
    
    (define (variable? x) (symbol? x))
    (define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))
  (define (make-sum a1 a2) (list '+ a1 a2))

(define (make-product m1 m2) (list '* m1 m2))
(define (sum? x)
    (and (pair? x) (eq? (car x) '+)))
  (define (addend s) (cadr s))
  (define (augend s) (caddr s))
  (define (product? x)
    (and (pair? x) (eq? (car x) '*)))
  (define (multiplier p) (cadr p))
  (define (multiplicand p) (caddr p))
  ;; representation of terms and term lists
  ; <procedures adjoin-term ...coeff from text below>
(define (add-terms L1 L2)
  (cond ((empty-termlist? L1) L2)
        ((empty-termlist? L2) L1)
        (else
         (let ((t1 (first-term L1)) (t2 (first-term L2)))
           (cond ((> (order t1) (order t2))
                  (adjoin-term
                   t1 (add-terms (rest-terms L1) L2)))
                 ((< (order t1) (order t2))
                  (adjoin-term
                   t2 (add-terms L1 (rest-terms L2))))
                 (else
                  (adjoin-term
                   (make-term (order t1)
                              (add (coeff t1) (coeff t2)))
                   (add-terms (rest-terms L1)
                              (rest-terms L2)))))))))
  ;; continued on next page

  (define (add-poly p1 p2) ...)
  <procedures used by add-poly>
  (define (mul-poly p1 p2) ...)
  <procedures used by mul-poly>
  ;; interface to rest of the system
  (define (tag p) (attach-tag 'polynomial p))
  (put 'add '(polynomial polynomial) 
       (lambda (p1 p2) (tag (add-poly p1 p2))))
  (put 'mul '(polynomial polynomial) 
       (lambda (p1 p2) (tag (mul-poly p1 p2))))
  (put 'make 'polynomial
       (lambda (var terms) (tag (make-poly var terms))))
  'done)



; (define (same-variable? v1 v2)
;   (and (variable? v1) (variable? v2) (eq? v1 v2)))

; (define (add-poly p1 p2)
;   (if (same-variable? (variable p1) (variable p2))
;       (make-poly (variable p1)
;                  (add-terms (term-list p1)
;                             (term-list p2)))
;       (error "Polys not in same var -- ADD-POLY"
;              (list p1 p2))))


; (define (mul-poly p1 p2)
;   (if (same-variable? (variable p1) (variable p2))
;       (make-poly (variable p1)
;                  (mul-terms (term-list p1)
;                             (term-list p2)))
;       (error "Polys not in same var -- MUL-POLY"
;              (list p1 p2))))


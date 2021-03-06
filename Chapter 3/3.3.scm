(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch pw m)
    (if (eq? password pw) 
        (cond ((eq? m 'withdraw ) withdraw)
          ((eq? m 'deposit ) deposit)
          (else (error "Unknown request -- MAKE-ACCOUNT"
                       m)))
        (error "Wrong PW")))
  dispatch)


(define acc (make-account 1000 'pw))

((acc 'pw 'deposit) 1000)
(define (make-time hr mn cat) (list hr mn cat))
(define hour car)
(define minute cadr)
(define category caddr)

(define test (make-time 9 50 'pm ) ) 

; (a)
(define (time-print-form time) 
    (word (hour time) ":" (minute time) (category time) )
)

; (make-time 9 50 "pm" ) 
(time-print-form test)

; (b)

(define (24-hour time) 
    (if (equal? (category time) 'pm )
        (word (+ 12 (hour time)) (minute time))
        (word (hour time) (minute time))
    ))

(24-hour test)

; (c)

(define (make-time-24 hr mn cat) 
    ( if (equal? cat 'pm )
        (word (+ 12 hr) mn)
        (word hr mn)
    ))

(define test (make-time-24 9 50 'pm ) ) 

(define (hour time)
    (let ( (hr (bl (bl time))) )
    (if (< hr 12)
        hr
        (- hr 12)
    )))

(define (minute time)
    (word (last (bl time)) (last time)))


(define (category time)
    (let ( (hr (bl (bl time))) )
    (if (< hr 12)
        'am
        'pm
    )))
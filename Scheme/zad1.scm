; apply lambda for all elements
; (cd "/home/bsadowsk/PWR/JIPP/Scheme")
; (load "zad1.scm")
; (mymap (lambda (x) (+ 1 x)) ’(0 2 4 6 8))

(define (mymap fun lista)
    (fun cdr lista))

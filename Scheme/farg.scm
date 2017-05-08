; hello with name
(define hello
  (lambda (name)
    (string-append "Hello " name "!")))


; sum of three numbers
(define sum3
  (lambda (a b c)
    (+ a b c)))

; add 1 to the argument
(define add1
  (lambda (a)
    (+ a 1)))

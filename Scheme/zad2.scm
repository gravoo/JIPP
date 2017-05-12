; (load "zad2.scm")
; (deriv '((x * x) + ((y * x) + z))  'x)
; (deriv '(x / b) 'x) 
; (deriv '(x * b) 'x) 
; (deriv '((x + a) * (x + b)) 'x)
(define (deriv exp var)
  (cond
    ((or (symbol? exp)(number? exp)) exp)
    ((sum? exp)
     (make-sum (deriv (car exp) var)
                          (deriv (caddr exp) var)))
    ((product? exp)
        (make-product (deriv (car exp) var) (deriv (caddr exp) var)))
    ))

(define (sum? exp)
  (and (pair? exp) (eqv? '+ (cadr exp))))
(define (make-sum a b)
  (cond ((and(number? a)(number? b) (+ a b)))
        (else (list a '+ b))))
(define (product? exp)
  (and (pair? exp) (eqv? '* (cadr exp))))
(define (make-product a b)
  (cond ((and(number? a)(number? b) (* a b)))
        (else (list a '* b))))

(trace deriv)
(trace make-sum)

(define (pochodna wyrazenie)
  (cond
    ((null? wyrazenie) 0)
    ((symbol? wyrazenie) 'wyrazenie)
    ((null? (cdr wyrazenie)) (car wyrazenie))
    (else
      (let ((skladnik (car wyrazenie))
            (operator (cadr wyrazenie))
            (reszta (cddr wyrazenie)))
        ((case operator
           ((+) +))
        skladnik
        (pochodna reszta))
       ))
    ))
(trace pochodna)


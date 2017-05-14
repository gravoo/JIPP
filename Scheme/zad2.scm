; (load "zad2.scm")
; (deriv '((x * x) + ((y * x) + z))  'x)
; (deriv '(x / b) 'x) 
; (deriv '(x * b) 'x) 
; (deriv '((x + a) * (x + b)) 'x)
(define (pochodna wyrazenie zmienna)
  list (liczpochodna (upraszczacz wyrazenie) zmienna))

(define (dupa)
  (list 5 5 '()))

(define (liczpochodna wyrazenie zmienna)
  (cond ((number? wyrazenie) 0)
        ((symbol? wyrazenie)
         (if (eqv? wyrazenie zmienna) 1 0))
        ((null? (cdr wyrazenie)) (liczpochodna (car wyrazenie) zmienna))
        (else            
          (let ((operand1 (car  wyrazenie))
                (operator (cadr wyrazenie))
                (operands (cddr wyrazenie)))
            (case operator
               ((+) (list (liczpochodna operand1 zmienna) '+ (liczpochodna operands zmienna)))
               ((-) (list (liczpochodna operand1 zmienna) '- (liczpochodna operands zmienna)))
               ((*) (list (list (liczpochodna operand1 zmienna) '* (caddr wyrazenie) ) '+
                          (list  operand1 '* (liczpochodna operands zmienna))))
               ((/) (list (list (liczpochodna operand1 zmienna) '* (caddr wyrazenie) ) '-
                          (list  operand1 '* (liczpochodna operands zmienna)) '/
                          (list  (caddr wyrazenie) '* (caddr wyrazenie))
                          ))
            )
        )))
 )

(define (upraszczacz exp)
  (cond
    ((or (symbol? exp)(number? exp)) exp)
    ((operation exp '+)
     (make-sum (upraszczacz (car exp))
                          (upraszczacz (caddr exp))))
    ((operation exp '-)
        (make-sub (upraszczacz (car exp)) (upraszczacz (caddr exp))))
    ((operation exp '*)
        (make-product (upraszczacz (car exp)) (upraszczacz (caddr exp))))
    ((operation exp '/)
        (make-div (upraszczacz (car exp)) (upraszczacz (caddr exp))))
    ))

(define (operation exp operand)
  (and (pair? exp) (eqv? operand (cadr exp))))
(define (make-sum a b)
  (cond 
    ((and(number? a)(number? b) (+ a b)))
        (else (list a '+ b))))
(define (make-product a b)
  (cond 
    ((and(number? a)(number? b) (* a b)))
        (else (list a '* b))))
(define (make-sub a b)
  (cond 
    ((and(number? a)(number? b) (- a b)))
        (else (list a '- b))))
(define (make-div a b)
  (cond 
    ((and(number? a)(number? b) (/ a b)))
        (else (list a '/ b))))

(trace upraszczacz)
(trace make-sum)
(trace sum?)
(trace pochodna)
(trace liczpochodna)


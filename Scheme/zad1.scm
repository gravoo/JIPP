; apply lambda for all elements
; (cd "/home/bsadowsk/PWR/JIPP/Scheme")
; (load "zad1.scm")
; (mymap (lambda (x) (+ 1 x)) ’(0 2 4 6 8))
; (mymap car '((1 2 3) (4 5 6) (7 8 9)))

(define (my-map fun . lss)
  (letrec ((iter (lambda (fun lss)
		       (if (null? lss)
			   '()
			   (cons (fun (car lss))
				 (iter fun (cdr lss))))))
	   (map-rec (lambda (fun lss)
		      (if (memq '() lss)
			  '()
			  (cons (apply fun (iter car lss))
				(map-rec fun (iter cdr lss)))))))
    (map-rec fun lss)))

(define (mymap fun lista)
  (map fun lista))


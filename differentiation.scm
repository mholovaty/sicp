;; Symbolic Differentiation

(define (=number? exp num)
  (and (number? exp) (= exp num)))

(define (variable? x)
  "Is `x' a variable?"
  (symbol? x))

(define (same-variable? v1 v2)
  "Are `v1' and `v2' the same variable?"
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (sum? x)
  "Is `x' a sum?"
  (and (pair? x) (eq? (car x) '+)))

(define (addend s)
  "Addend of the sum `s'."
  (cadr s))

(define (augend s)
  "Augend of the sum `s'."
  (caddr s))

(define (make-sum a1 a2)
  "Construct the sum of `a1' and `a2'."
  (cond ((=number? a1 0) a2)
	((=number? a2 0) a1)
	((and (number? a1) (number? a2)) (+ a1 a2))
	(else (list '+ a1 a2))))

(define (product? x)
  "Is `x' a product?"
  (and (pair? x) (eq? (car x) '*)))

(define (multiplier p)
  "Multiplier of the product `p'."
  (cadr p))

(define (multiplicand p)
  "Multiplicand of the product `p'."
  (caddr p))

(define (make-product m1 m2)
  "Construct the product of `m1' and `m2'."
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
	((=number? m1 1) m2)
	((=number? m2 1) m1)
	((and (number? m1) (number? m2)) (* m1 m2))
	(else (list '* m1 m2))))

(define (exponentiation? x)
  "Is `x' an exponentiation?"
  (and (pair? x) (eq? (car x) '**)))

(define (base e)
  "Base of exponentiation `e'"
  (cadr e))

(define (exponent e)
  "Exponent of exponentiation `e'"  
  (caddr e))

(define (make-exponentiation z1 z2)
  "Construct the exponentiation of `z1' and `z2'."
  (cond ((=number? z2 0) 1)
	((=number? z2 1) z1)
	((and (number? z1) (number? z2)) (expt z1 z2))
	(else (list '** z1 z2))))


(define (deriv exp var)
  (cond
   ((number? exp) 0)
   ((variable? exp)
    (if (same-variable? exp var) 1 0))
   ((sum? exp)
    (make-sum (deriv (addend exp) var)
	      (deriv (augend exp) var)))
   ((product? exp)
    (make-sum
     (make-product (multiplier exp)
		   (deriv (multiplicand exp) var))
     (make-product (deriv (multiplier exp) var)
		   (multiplicand exp))))
   ((exponentiation? exp)
    (make-product
     (make-product
      (exponent exp)
      (make-exponentiation (base exp) (- (exponent exp) 1)))
     (deriv (base exp) var)))
   (else
    (error "unknown expression type -- DERIV" exp))))


(deriv '(+ x 3) 'x)
(deriv '(* x y) 'x)
(deriv '(* (* x y) (+ x 3)) 'x)
(deriv '(** x 3) 'x)

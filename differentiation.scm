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
  (apply make-sum (cddr s)))

(define (make-sum . a)
  "Construct the sum of `a1', `a2', ..."
  (if
   (null? a) 0
   (let ((a1 (car a))
	 (a2 (apply make-sum (cdr a))))
     (cond ((=number? a2 0) a1)
	   ((=number? a1 0) a2)
	   ((and (number? a1) (number? a2)) (+ a1 a2))
	   (else (list '+ a1 a2))))))

(define (product? x)
  "Is `x' a product?"
  (and (pair? x) (eq? (car x) '*)))

(define (multiplier p)
  "Multiplier of the product `p'."
  (cadr p))

(define (multiplicand p)
  "Multiplicand of the product `p'."
  (apply make-product (cddr p)))

(define (make-product . m)
  "Construct the product of `m1', `m2', ..."
  (if
   (null? m) 1
   (let ((m1 (car m))
	 (m2 (apply make-product (cdr m))))
     (cond ((=number? m2 1) m1)
	   ((=number? m1 1) m2)
	   ((or (=number? m1 0) (=number? m2 0)) 0)
	   ((and (number? m1) (number? m2)) (* m1 m2))
	   (else (list '* m1 m2))))))

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


(equal?
 (deriv '(+ x 3) 'x)
 1)

(equal?
 (deriv '(* x y) 'x)
 'y)

(equal?
 (deriv '(* (* x y) (+ x 3)) 'x)
 '(+ (* x y) (* y (+ x 3))))

(equal?
 (deriv '(* x y (+ x 3)) 'x)
 '(+ (* x y) (* y (+ x 3))))

(equal?
 (deriv '(** x 3) 'x)
 '(* 3 (** x 2)))

;;; sicp.scm --- SICP Exercises


;; Math functions

(define (square x)
  (* x x))


(define (average x y) 
  (/ (+ x y) 2))


(define (sqrt x)

  (define (sqrt-iter guess guess-prime)
    (if (good-enough? guess guess-prime)
	guess-prime
	(sqrt-iter guess-prime (improve guess-prime))))

  (define (improve guess)
    (average guess (/ x guess)))

  (define (good-enough? guess guess-prime)
    (< (abs (/ (- guess guess-prime) guess)) 10e-16))

  (sqrt-iter 1.0 (improve 1.0)))


(define (cbrt x)

  (define (cbrt-iter guess guess-prime)
    (if (good-enough? guess guess-prime)
	guess-prime
	(cbrt-iter guess-prime (improve guess-prime))))

  (define (improve guess)
    (/ (+ (/ x (square guess))
	  (* 2 guess))
       3))

  (define (good-enough? guess guess-prime)
    (< (abs (/ (- guess guess-prime) guess)) 10e-16))

  
  (cbrt-iter 1.0 (improve 1.0)))


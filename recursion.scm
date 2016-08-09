;; Procedures and Processes

(define (fib n)
  (cond ((= n 1) 1)
	((= n 2) 1)
	(else
	 (+ (fib (- n 1))
	    (fib (- n 2))
	    ))))


(define (factorial n)
  (if (= n 1)
      1
      (* n (factorial (- n 1)))))


(define (fact-iter product counter max-count)
  (if (> counter max-count)
      product
      (fact-iter (* counter product)
		 (+ counter 1)
		 max-count)))

(define (factorial-2 n)
  (fact-iter 1 1 n))



(define (foo n)
  (cond ((< n 3) n)
	(else
	 (+ (foo (- n 1)) (* 2 (foo (- n 2))) (* 3 (foo (- n 3)))))))

(define (foo-iter foo-n-1 foo-n-2 foo-n-3 counter max-count)
  (if (> counter max-count)
      foo-n-1
      (foo-iter 
       (+ foo-n-1 (* 2 foo-n-2) (* 3 foo-n-3) )
       foo-n-1 foo-n-2 (+ counter 1) max-count)))


(define (foo-1 n)
  (cond ((< n 3) n)
	(else
	 (foo-iter 2 1 0 3 n))))


(define (pascal-triangle n k)
  (cond ((< n 0) 0)
	((< k 0) 0)
	((> k n) 0)
	((= n 0) 1)
	(else (+ 
	       (pascal-triangle (- n 1) (- k 1)) 
	       (pascal-triangle (- n 1) k)))))


; fi = (1 + sqrt_5)/2
; Fib(n) is the closest integer to fi**n/sqrt_5, where 
;   ksi = (1 - sqrt_5)/2
;   Fib(n) = (fi**n - ksi**n)/sqrt_5
;       n = 0
;         (((1 + sqrt_5)/2)**0 - ((1-sqrt_5/2)/2)**0)/sqrt_5 =
;         0
;       n = 1
;         (((1 + sqrt_5)/2)**1 - ((1 - sqrt_5)/2)**1)/sqrt_5 = 
;         ((1 + sqrt_5 - 1 + sqrt_5)/2)/sqrt_5 =
;         (2*sqrt_5/2)/sqrt_5 =
;         1
;       Fib(n + 2) = Fib(n + 1) + Fib(n)
;         
;         (fi**(n + 2) - ksi**(n + 2))/sqrt_5 =
;
;         (fi**(n + 1) - ksi**(n + 1))/sqrt_5 +
;         (fi**n - ksi**n)/sqrt_5 = 
;         (fi**(n + 1) + fi**n - ksi**(n + 1) - ksi**n)/sqrt_5 =
;         (fi**n*fi + fi**n - ksi**n*ksi - ksi**n)/sqrt_5 = 
;         (fi**n*(fi + 1) - ksi**n*(ksi + 1))/sqrt_5
;
;         fi**2 = fi + 1
;           ((1 + sqrt_5)/2)**2 =
;           (1 + sqrt_5)**2/4 = 
;           (1 + 2*sqrt_5 + 5)/4 =
;           (6 + 2*sqrt_5)/4 =
;           2*(3 + sqrt_5)/4 =
;           (1 + sqrt_5 + 2)/2 = 
;           (1 + sqrt_5)/2 + 1 =
;
;         ksi**2 = ksi + 1
;           ((1 - sqrt_5)/2)**2 = 
;           ((1 - sqrt_5)**2/4 = 
;           ((1 - 2*sqrt_5 + 5)/4 =
;           ((6 - 2*sqrt_5)/4 =
;           2*(3 - sqrt_5)/2 =
;           (1 - sqrt_5 + 2)/2 =
;           (1 - sqrt_5)/2 + 1
;         

;;; Rational Numbers

(define (gcd a b)
  ;; Gratest Common Divisor
  (if (= b 0)
      a
      (gcd b (remainder a b))))


(define (_make-rat n d)
  ;; Make a rational number as a numerator and denominator pair
  (cons n d))


(define (_normilize-rat _make-rat)
  ;; Normilize the sign.
  ;; If the rational number is positive, both the numerator and denominator are positive.
  ;; If the rational number is negative, only the numerator is negative.
  (lambda (n d)
    (if (< d 0)
	(_make-rat (- n) (- d))
	(_make-rat n d))))


(define (_reduce-rat _make-rat)
  ;; Reduce numerator and denominator to the lowest term
  (lambda (n d)
    (let ((g (gcd n d)))
      (_make-rat (/ n g) (/ d g)))))


(define make-rat (_reduce-rat (_normilize-rat _make-rat)))

(define (numer x) (car x))

(define (denom x) (cdr x))

(define (print-rat x)
  (display (numer x))
  (display "/")
  (display (denom x))
  (newline))


;;; Arithmetic Operations for Rational Numbers

(define (add-rat x y)
  (make-rat  (+ (* (numer x) (denom y))
		(* (numer y) (denom x)))
	     (* (denom x) (denom y))))

(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
	       (* (numer y) (denom x)))
	    (* (denom x) (denom y))))

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
	    (* (denom x) (denom y))))

(define (div-rat x y)
  (make-rat (* (numer x) (denom y ))
	    (* (denom x) (numer y))))

(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (denom x) (numer x))))


;;; Named Rational Numbers

(define one-half (make-rat 1 2))

(define one-third (make-rat 1 3))

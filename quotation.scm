

(define (memq item x)
  (cond ((null? x) #f)
	((eq? item (car x)) x)
	(else (memq item (cdr x)))))

(define (_equal? a b)
  (cond ((and (symbol? a) (symbol? b))
	 (eq? a b))
	((and (list? a) (list? b))
	 (or (and (null? a) (null? b))
	     (and (_equal? (car a) (car b))
		  (_equal? (cdr a) (cdr b)))))
	(else #f)))

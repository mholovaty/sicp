

(define (combinations-rep s)
  "Return a list of combinations with repetitions"

  (define (c1 e ll)
    (map (lambda (l) (cons e l)) ll))

  (define (c2 acc)
    (apply append (map (lambda (e) (c1 e acc)) s)))

  (define (c3 i acc)
    (if (eq? i 0) acc (c3 (- i 1) (c2 acc))))

  (c3 (length s) (list (list))))

(eq?
 (length (combinations-rep '(1 2 3)))
 (expt 3 3))

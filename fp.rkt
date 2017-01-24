;; Given a list, the function returns a list with elements in reverse order.
;; Even the sublists inside the list are reversed within.
(DEFINE (reverse-general L)
  ;; Helper function that takes two lists as parameters.
  ;; Returns a list where the two lists are concatenated with each other.
  (DEFINE (append L1 L2)
    (COND
      ((NULL? L1) L2)
      (ELSE (CONS (CAR L1)
                  (append (CDR L1) L2)))
     )
  )
  (COND
    ((NULL? L) '()) ;; Empty List
    ((LIST? (CAR L)) (append (CDR L) (LIST (reverse-general(CAR L))))) 
    (ELSE (append (reverse-general(CDR L)) (LIST(CAR L))))
  )
 )

;; Given a list, the function returns the sume of numbers not in nested lists in the list.
(DEFINE (sum-up-numbers-simple L)
  (COND
    ((NULL? L) 0)
    ((NUMBER? (CAR L)) (+ (CAR L) (sum-up-numbers-simple (CDR L))))
    (ELSE (sum-up-numbers-simple (CDR L)))
  )
)

;; Given a list, the function returns the sum of all the numbers (including those in nested lists) in the liost.
(DEFINE (sum-up-numbers-general L)
  (COND
    ((NULL? L) 0)
    ((LIST? (CAR L)) (+ (sum-up-numbers-general (CAR L)) (sum-up-numbers-general (CDR L))))
    ((NUMBER? (CAR L)) (+ (CAR L) (sum-up-numbers-general (CDR L))))
    (ELSE (sum-up-numbers-general (CDR L)))
  )
)
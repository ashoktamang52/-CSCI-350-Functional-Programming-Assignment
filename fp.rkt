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
(DEFINE (sum-up-numbers L)
  (COND
    ((NULL? L) 0)
    ((NUMBER? (CAR L)) (+ (CAR L) (sum-up-numbers (CDR L))))
    (ELSE (sum-up-numbers (CDR L)))
  )
)
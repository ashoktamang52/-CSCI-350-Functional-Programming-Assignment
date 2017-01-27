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
    ((LIST? (CAR L)) (append (reverse-general (CDR L)) (LIST (reverse-general(CAR L))))) 
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

;; Helper Funciton: Given a list of numeric atoms, the function returns a minimum of the numbers in that list.
(DEFINE (min-from-list L)
        (COND
         ((NULL? (CDR L)) (CAR L))
         ; [TODO] Case for alpha-atoms as last element in the list.
         (ELSE
          (IF (NUMBER? (CAR L))
           (MIN (CAR L) (min-from-list (CDR L)))
           (min-from-list(CDR L))
          )
         )
        )
)

;; Helper Function: Given a list of alpha-numeric atoms, the function returns a new list of
;; only numeric atoms.
(DEFINE (only-numeric L)
        (COND
         ((NULL? L) '())
         (ELSE
          (IF (NUMBER? (CAR L))
              (CONS (CAR L) (only-numeric (CDR L)))
              (only-numeric (CDR L))
          )
         )
        )
)

;; Helper Function: Given a list and a number, the function returns a new list of all the numbers
;; that are greater than the given number
(DEFINE (greater-than-list L N)
        (COND
         ((NULL? L) '())
         (ELSE
          (IF (> (CAR L) N)
              (CONS (CAR L) (greater-than-list (CDR L) N))
              (greater-than-list (CDR L) N)
          )
         )
        )
)
         

;; Given two different lists, the function returns the minimum of numbers in L1 that are
;; larger than the smallest number in L2.
(DEFINE (min-above-min L1 L2)
  (COND
    ((NULL? L1) #F)
    ((NULL? L2)
     (IF (NUMBER? (min-from-list L1))
         (min-from-list L1)
         #F
     )
    )
    (ELSE
     (IF (NUMBER? (min-from-list L2))
        (IF (NULL? (greater-than-list L1 (min-from-list L2)))
            #F
            (min-from-list (greater-than-list L1 (min-from-list L2)))
        )
        (IF (NUMBER? (min-from-list L1))
            (min-from-list L1)
            #F
        )
     )
    )
  ) 
)
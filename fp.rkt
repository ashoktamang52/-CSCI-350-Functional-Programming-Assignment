;; [Part 1]
;; Parameter(s): <list>
;; Returns: List with elements in reverse order.
;;          Even the sublists inside the list are reversed within.
(DEFINE (reverse-general L)
  (COND
    ((NULL? L) '()) ;; Empty List
    ((LIST? (CAR L)) (append (reverse-general (CDR L)) (LIST (reverse-general(CAR L))))) 
    (ELSE (append (reverse-general(CDR L)) (LIST(CAR L))))
  )
 )

;; [Part 2]
;; Parameter(s): <list>
;; Returns: Sum of numbers not in nested lists in the list.
(DEFINE (sum-up-numbers-simple L)
  (COND
    ((NULL? L) 0)
    ((NUMBER? (CAR L)) (+ (CAR L) (sum-up-numbers-simple (CDR L))))
    (ELSE (sum-up-numbers-simple (CDR L)))
  )
)

;; [Part 3]
;; Parameter(s): <list>
;; Returns: Sum of all the numbers (including those in nested lists) in the liost.

(DEFINE (sum-up-numbers-general L)
  (COND
    ((NULL? L) 0)
    ((LIST? (CAR L)) (+ (sum-up-numbers-general (CAR L)) (sum-up-numbers-general (CDR L))))
    ((NUMBER? (CAR L)) (+ (CAR L) (sum-up-numbers-general (CDR L))))
    (ELSE (sum-up-numbers-general (CDR L)))
  )
)

;; [Helper function]
;; Parameter(s): <list>
;; Assumption(s): List only contains numeric atoms.
;; Returns: Minimum of the numbers in that list.
(DEFINE (min-from-list L)
  (COND
    ((NULL? (CDR L)) (CAR L))
    (ELSE
      (IF (NUMBER? (CAR L))
        (MIN (CAR L) (min-from-list (CDR L)))
        (min-from-list(CDR L))
      )
    )
  )
)

;; [Helper function]
;; Parameter(s): <list>
;; Returns: List of only numeric atoms.
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

;; [Helper function]
;; Parameter(s): <list> <numeric-atom>
;; Returns: List of all the numbers that are greater than the given number.
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
         
;; [Part 4]
;; Parameter(s): <list> <list>
;; Returns: Minimum of numbers in L1 that are larger than the smallest number in L2.
(DEFINE (min-above-min L1 L2)
  (COND
    ((NULL? L1) #F)
    ((NULL? L2)
      (IF (NULL? (only-numeric L1)) ; If list doesn't have any numeric atoms.
        #F
        (min-from-list (only-numeric L1))
      )
    )
    (ELSE
      (IF (NULL? (only-numeric L1)) ; If L1 doesn't have any numeric atoms.
        #F
        (IF (NULL? (only-numeric L2))
          (min-from-list (only-numeric L1))
          (IF (NULL? (greater-than-list (only-numeric L1) (min-from-list (only-numeric L2))))
            #F
            (min-from-list (greater-than-list
                                  (only-numeric L1)
                                  (min-from-list (only-numeric L2))))
          )
        ) 
      )
    )
  ) 
)
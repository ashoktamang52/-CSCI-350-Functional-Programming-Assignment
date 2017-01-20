(DEFINE (reverse-general L)
  (COND
    ((NULL? L) L) ;; Empty List
    (ELSE (LIST (reverse-general (CDR L)) (CAR L)))
  )
 )
 